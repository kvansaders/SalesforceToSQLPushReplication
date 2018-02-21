using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using Dapper;
using Newtonsoft.Json;

namespace SalesForce.OutboundMessages.Listeners.Repositories

{
    public class NotificationRepository : INotificationRepository
    {
        //private IConfigurationConnectionSettings settings;
        //public NotificationRepository(IConfigurationConnectionSettings settings)
        //{
        //    this.settings = settings;
        //}
        //public NotificationRepository()
        //{ }
        public Guid InsertMessage(IDictionary<string, string> messagePayload)
        {

            string jsonValues = JsonConvert.SerializeObject(messagePayload);
            string entityRowId = messagePayload["Id"];
            string notificationType = messagePayload["_NotificationType"];
            DateTime lastModifiedDate = DateTime.Parse(messagePayload["LastModifiedDate"]);

            //using (IDbConnection db = new SqlConnection(settings.Get("CRMOutboundMessagesDB")))
            using (IDbConnection db = new SqlConnection(ConfigurationManager.ConnectionStrings["CRMOutboundMessagesDB"].ConnectionString)) 
            {
                string sql = @"usp_InsertNotification";
                return db.ExecuteScalar<Guid>(sql, new { notificationType, entityRowId, lastModifiedDate, jsonValues }, commandType: CommandType.StoredProcedure);
            }
        }
    }

    public interface INotificationRepository
    {
        Guid InsertMessage(IDictionary<string, string> messagePayload);
    }
}