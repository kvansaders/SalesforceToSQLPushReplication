<Query Kind="Program">
  <Namespace>System.Net</Namespace>
</Query>

void Main(string[] args)
{
	// Loading XML Document from saved file
	
	
	string filePath = (args!=null && args.Length>0 ? args[0] : Util.ReadLine("No arguments found.  Please enter the path to the Enterprise Partner WSDL saved from Salesforce."));
	//C:\Development\USGA-SalesForceListeners\SalesforceOutboundSQLGenerator\ContactOut.xml");
	
	var sfWSDL = XDocument.Load(filePath);
	
	//// Once Oauth or Basic is set up, can download directly from partner wsdl url
	//string url = "https://mep--ghindev.cs30.my.salesforce.com/soap/wfoutbound.jsp?aid=04kn000000000m5&type=Partner";
	//byte[] data;
	//using (WebClient webClient = new WebClient())
	//{
	//	data = webClient.DownloadData(url);
	//}
	//string str = Encoding.GetEncoding("Windows-1252").GetString(data);
	//var sfWSDL = XDocument.Parse(str);
	
	
	
	
	List<string> complexTypesToIgnore = new List<string>{
		"sObject",
		"AggregateResult"
		};
	List<string> fieldsToIgnore = new List<string>{
		"OrganizationId",
		"ActionId",
		"SessionId",
		"EnterpriseUrl",
		"PartnerUrl",
		"Notification",
		"sObject",
		"Ack",
		"fieldsToNull"
	};
	
	// Dictionary<xsd type, sql type>
	Dictionary<string, string> xsdToSQLTypes = new Dictionary<string, string>{
		{"ent:ID", "nvarchar(100)"},
		{"xsd:string", "nvarchar(100)"},
		{"xsd:ID", "nvarchar(100)"},
		{"xsd:IDREF", "nvarchar(100)"},
		{"xsd:IDREFS", "nvarchar(100)"},
		{"xsd:language", "nvarchar(100)"},
		{"xsd:Name", "nvarchar(100)"},
		{"xsd:NMTOKEN", "nvarchar(100)"},
		{"xsd:NMTOKENS", "nvarchar(100)"},
		{"xsd:normalizedString", "nvarchar(100)"},
		{"xsd:QName", "nvarchar(100)"},
		{"xsd:token", "nvarchar(100)"},
		{"xsd:date", "datetime2"},
		{"xsd:dateTime", "datetime2"},
		{"xsd:decimal", "decimal"},
		{"xsd:byte", "tinyint"},
		{"xsd:int", "int"},
		{"xsd:long", "bigint"},
		{"xsd:negativeInteger", "int"},
		{"xsd:nonNegativeInteger", "int"},
		{"xsd:nonPositiveInteger", "int"},
		{"xsd:positiveInteger", "int"},
		{"xsd:short", "smallint"},
		{"xsd:unsignedLong", "bigint"},
		{"xsd:unsignedInt", "int"},
		{"xsd:unsignedShort", "smallint"},
		{"xsd:unsignedByte", "tinyint"},
		{"xsd:anyURI", "nvarchar(100)"},
		{"xsd:base64Binary", "varbinary(max)"},
		{"xsd:boolean", "bit"},
		{"xsd:double", "double precision"},
		{"xsd:float", "float"},
		{"xsd:hexBinary", "varbinary(max)"},
		{"xsd:NOTATION", "nvarchar(max)"}
	
	};
	
	
	// Getting notification/table name
	string tableName = sfWSDL.Descendants("{http://www.w3.org/2001/XMLSchema}complexType")
			.Where(c => c.Attribute("name") != null && c.Attribute("name").Value.Contains("Notification") && !(complexTypesToIgnore.Contains(c.Attribute("name").Value)))
			.Select(c => c.Attribute("name").Value).FirstOrDefault().Replace("Notification", "");
	
	
	// Getting all fields from XML, filtering out all from ignore list above, storing into list
	var columns = sfWSDL.Descendants("{http://www.w3.org/2001/XMLSchema}element")
					.Where(c =>
						c.Parent.Name == "{http://www.w3.org/2001/XMLSchema}sequence"
						&& (!fieldsToIgnore.Contains(c.Attribute("name").Value)))
						.Select(result => new
						{
							name = result.Attribute("name").Value
					   ,
							type = result.Attribute("type").Value
						}).Distinct()
						.ToList();
	
	
			// create SQL string builder for create table statement
			StringBuilder sbCreateTable = new StringBuilder();
			sbCreateTable.AppendLine(@"/* Auto-generated create table script for SalesforceMirror database */");
			sbCreateTable.AppendLine(@"use SalesforceMirror ");
			sbCreateTable.AppendLine(@"CREATE TABLE dbo." + tableName + " ( ");
			sbCreateTable.AppendLine(@" TableRowId BIGINT IDENTITY(1,1), ");
			// convert to SQL table statement		 	
				foreach(var column in columns)
				{
					sbCreateTable.AppendLine(column.name + " " + (xsdToSQLTypes.ContainsKey(column.type)? xsdToSQLTypes[column.type] : "nvarchar(100) /*TYPE " + column.type + " NOT MAPPED*/") + " " +
						(column.name=="Id"?"NOT NULL ":"NULL ") + ",");
					
				}
					
				sbCreateTable.AppendLine("CONSTRAINT pk_" + tableName + " PRIMARY KEY NONCLUSTERED(ID) ) ");
				sbCreateTable.AppendLine("CREATE INDEX IDX_LastModifiedDate ON " + tableName + "(LastModifiedDate)");
				sbCreateTable.AppendLine("CREATE UNIQUE CLUSTERED INDEX IDX_TableRowId ON " + tableName + "(TableRowId)");
				
				sbCreateTable.ToString().Dump();
	
	
	
			//create SQL string builder for OPENJSON query from payload in outbound message listener database and insert statement
			List<string> columnLines = new List<string>();

			//create SQL string builder for MERGES
			StringBuilder sbInsert = new StringBuilder();
			sbInsert.AppendLine("MERGE SalesforceMirror.dbo." + tableName + @" as Destination USING ( SELECT jsonData.* FROM dbo.Notifications a CROSS APPLY OPENJSON(Payload) WITH (");
			List<string> insertColumns = new List<string>();
			List<string> updateColumns = new List<string>();
			List<string> sourceColumns = new List<string>();
			
			
			foreach (var column in columns)
			{
				columnLines.Add(column.name + " " + (xsdToSQLTypes.ContainsKey(column.type)? xsdToSQLTypes[column.type] : "nvarchar(100) /*TYPE " + column.type + " NOT MAPPED*/") );
				insertColumns.Add(column.name);
				sourceColumns.Add("Source." + column.name);
	
				if (column.name != "Id")
				{
					updateColumns.Add("Destination." + column.name + " = Source." + column.name);
				}
			}
	
			sbInsert.Append(String.Join(",\n", columnLines));
			sbInsert.AppendLine(@" ) AS jsonData		
							WHERE NotificationType = '" + tableName + @"'
							AND ProcessedDate IS NULL
							AND a.NotificationId = @notificationId ) AS Source
							ON Destination.Id = Source.Id ");
	
			sbInsert.AppendLine(@" WHEN MATCHED AND Destination.LastModifiedDate < Source.LastModifiedDate THEN UPDATE SET ");
			sbInsert.AppendLine(String.Join(",\n", updateColumns));
			
			sbInsert.AppendLine(@" WHEN NOT MATCHED THEN INSERT (" + String.Join(", ", insertColumns) + ")");
			sbInsert.AppendLine(@" VALUES (" + String.Join(", ", sourceColumns) + ")");
	
			// always end a MERGE with a semi-colon
			sbInsert.AppendLine(";");

			//Create Procedure for loading to Mirror
			StringBuilder sbLoadProc = new StringBuilder();
			sbLoadProc.AppendLine(@" GO ");
			sbLoadProc.AppendLine(@"/* Auto-generated create table script for CRMOutboundMessages database */");
			sbLoadProc.AppendLine(@"use CRMOutboundMessages ");
			sbLoadProc.AppendLine(@" GO ");
			sbLoadProc.AppendLine(@"CREATE PROCEDURE usp_LoadMirror_" + tableName + @"(@notificationId UNIQUEIDENTIFIER) AS ");
			sbLoadProc.AppendLine(sbInsert.ToString());
			
			sbLoadProc.AppendLine(@" UPDATE Notifications SET ProcessedDate = SYSUTCDATETIME() WHERE NotificationId = @notificationId ");
					
			sbLoadProc.AppendLine(" GO ");
			sbLoadProc.AppendLine(" GRANT EXECUTE ON usp_LoadMirror_" + tableName + " TO CRMListenerWrite ");
			sbLoadProc.AppendLine(" GO ");
			sbLoadProc.AppendLine(" INSERT INTO NotificationToMirrorLoadProcedureMap(NotificationType, ProcedureName) VALUES('" + tableName + "', 'usp_LoadMirror_" + tableName + "') ");
			
			sbLoadProc.ToString().Dump();
}

// Define other methods and classes here