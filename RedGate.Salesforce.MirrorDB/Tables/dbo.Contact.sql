CREATE TABLE [dbo].[Contact]
(
[TableRowId] [bigint] NOT NULL IDENTITY(1, 1),
[Id] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[AccountId] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Account_Source__c] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Active__c] [float] NULL,
[Admin__c] [bit] NULL,
[Age__c] [float] NULL,
[Alias__c] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AssistantName] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AssistantPhone] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Birthdate] [datetime2] NULL,
[CRM_Dynamics_Contact_Id__c] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Club_Name__c] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ContactIdentityStatus__c] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CreatedById] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CreatedDate] [datetime2] NULL,
[Date_of_Death__c] [datetime2] NULL,
[Department] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Description] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DoNotCall] [bit] NULL,
[Email] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EmailBouncedDate] [datetime2] NULL,
[EmailBouncedReason] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[End_Date__c] [datetime2] NULL,
[External_Id__c] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Fax] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FirstName] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[GHIN__c] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[GW_Volunteers__First_Volunteer_Date__c] [datetime2] NULL,
[GW_Volunteers__Last_Volunteer_Date__c] [datetime2] NULL,
[GW_Volunteers__Unique_Volunteer_Count__c] [float] NULL,
[GW_Volunteers__Volunteer_Auto_Reminder_Email_Opt_Out__c] [bit] NULL,
[GW_Volunteers__Volunteer_Availability__c] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[GW_Volunteers__Volunteer_Hours__c] [float] NULL,
[GW_Volunteers__Volunteer_Last_Web_Signup_Date__c] [datetime2] NULL,
[GW_Volunteers__Volunteer_Manager_Notes__c] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[GW_Volunteers__Volunteer_Notes__c] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[GW_Volunteers__Volunteer_Organization__c] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[GW_Volunteers__Volunteer_Skills__c] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[GW_Volunteers__Volunteer_Status__c] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Gender__c] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[GigyaUid__c] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Golfer_Id__c] [float] NULL,
[Golfer__c] [bit] NULL,
[GuardianContactSysID__c] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Guardian__c] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Handicap_Index_Type__c] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[HasOptedOutOfEmail] [bit] NULL,
[HasOptedOutOfFax] [bit] NULL,
[HomePhone] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Inactive__c] [float] NULL,
[IsDeleted] [bit] NULL,
[IsEmailBounced] [bit] NULL,
[Is_Guardian__c] [bit] NULL,
[Jigsaw] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[JigsawContactId] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LastActivityDate] [datetime2] NULL,
[LastCURequestDate] [datetime2] NULL,
[LastCUUpdateDate] [datetime2] NULL,
[LastModifiedById] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LastModifiedDate] [datetime2] NULL,
[LastName] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LastReferencedDate] [datetime2] NULL,
[LastViewedDate] [datetime2] NULL,
[LeadSource] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Legacy_GHIN_ID__c] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Lowest_18_HCP__c] [float] NULL,
[Lowest_9_HCP__c] [float] NULL,
[MailingCity] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MailingCountry] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MailingCountryCode] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MailingGeocodeAccuracy] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MailingLatitude] [float] NULL,
[MailingLongitude] [float] NULL,
[MailingPostalCode] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MailingState] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MailingStateCode] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MailingStreet] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MasterRecordId] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Membership_Type__c] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Merged_To__c] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MiddleName] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Minor_Contact_to_Gigya__c] [bit] NULL,
[Minor_turned_18__c] [bit] NULL,
[MobilePhone] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[OtherCity] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[OtherCountry] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[OtherCountryCode] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[OtherGeocodeAccuracy] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[OtherLatitude] [float] NULL,
[OtherLongitude] [float] NULL,
[OtherPhone] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[OtherPostalCode] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[OtherState] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[OtherStateCode] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[OtherStreet] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[OwnerId] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Phone] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PhotoUrl] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Primary_Email__c] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Profile_Name__c] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RecordTypeId] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ReportsToId] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SRGA_Admin__c] [bit] NULL,
[SRGA_dummy__c] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Salutation] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Secondary_Email__c] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Send_Contact_to_Gigya__c] [bit] NULL,
[Start_Date__c] [datetime2] NULL,
[Status__c] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Suffix__c] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SystemModstamp] [datetime2] NULL,
[Title] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[USGA_Id__c] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Use_Secondary_Email__c] [bit] NULL,
[npe01__AlternateEmail__c] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npe01__HomeEmail__c] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npe01__Home_Address__c] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npe01__Last_Donation_Date__c] [datetime2] NULL,
[npe01__Lifetime_Giving_History_Amount__c] [float] NULL,
[npe01__Organization_Type__c] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npe01__Other_Address__c] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npe01__PreferredPhone__c] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npe01__Preferred_Email__c] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npe01__Primary_Address_Type__c] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npe01__Private__c] [bit] NULL,
[npe01__Secondary_Address_Type__c] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npe01__SystemAccountProcessor__c] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npe01__SystemIsIndividual__c] [bit] NULL,
[npe01__Type_of_Account__c] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npe01__WorkEmail__c] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npe01__WorkPhone__c] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npe01__Work_Address__c] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npo02__AverageAmount__c] [float] NULL,
[npo02__Best_Gift_Year_Total__c] [float] NULL,
[npo02__Best_Gift_Year__c] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npo02__FirstCloseDate__c] [datetime2] NULL,
[npo02__Formula_HouseholdMailingAddress__c] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npo02__Formula_HouseholdPhone__c] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npo02__Household_Naming_Order__c] [float] NULL,
[npo02__Household__c] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npo02__LargestAmount__c] [float] NULL,
[npo02__LastCloseDateHH__c] [datetime2] NULL,
[npo02__LastCloseDate__c] [datetime2] NULL,
[npo02__LastMembershipAmount__c] [float] NULL,
[npo02__LastMembershipDate__c] [datetime2] NULL,
[npo02__LastMembershipLevel__c] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npo02__LastMembershipOrigin__c] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npo02__LastOppAmount__c] [float] NULL,
[npo02__MembershipEndDate__c] [datetime2] NULL,
[npo02__MembershipJoinDate__c] [datetime2] NULL,
[npo02__Naming_Exclusions__c] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npo02__NumberOfClosedOpps__c] [float] NULL,
[npo02__NumberOfMembershipOpps__c] [float] NULL,
[npo02__OppAmount2YearsAgo__c] [float] NULL,
[npo02__OppAmountLastNDays__c] [float] NULL,
[npo02__OppAmountLastYearHH__c] [float] NULL,
[npo02__OppAmountLastYear__c] [float] NULL,
[npo02__OppAmountThisYearHH__c] [float] NULL,
[npo02__OppAmountThisYear__c] [float] NULL,
[npo02__OppsClosed2YearsAgo__c] [float] NULL,
[npo02__OppsClosedLastNDays__c] [float] NULL,
[npo02__OppsClosedLastYear__c] [float] NULL,
[npo02__OppsClosedThisYear__c] [float] NULL,
[npo02__SmallestAmount__c] [float] NULL,
[npo02__Soft_Credit_Last_Year__c] [float] NULL,
[npo02__Soft_Credit_This_Year__c] [float] NULL,
[npo02__Soft_Credit_Total__c] [float] NULL,
[npo02__Soft_Credit_Two_Years_Ago__c] [float] NULL,
[npo02__SystemHouseholdProcessor__c] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npo02__TotalMembershipOppAmount__c] [float] NULL,
[npo02__TotalOppAmount__c] [float] NULL,
[npo02__Total_Household_Gifts__c] [float] NULL,
[npsp__Address_Verification_Status__c] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npsp__Batch__c] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npsp__Current_Address__c] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npsp__Deceased__c] [bit] NULL,
[npsp__Do_Not_Contact__c] [bit] NULL,
[npsp__Exclude_from_Household_Formal_Greeting__c] [bit] NULL,
[npsp__Exclude_from_Household_Informal_Greeting__c] [bit] NULL,
[npsp__Exclude_from_Household_Name__c] [bit] NULL,
[npsp__First_Soft_Credit_Amount__c] [float] NULL,
[npsp__First_Soft_Credit_Date__c] [datetime2] NULL,
[npsp__HHId__c] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npsp__Largest_Soft_Credit_Amount__c] [float] NULL,
[npsp__Largest_Soft_Credit_Date__c] [datetime2] NULL,
[npsp__Last_Soft_Credit_Amount__c] [float] NULL,
[npsp__Last_Soft_Credit_Date__c] [datetime2] NULL,
[npsp__Number_of_Soft_Credits_Last_N_Days__c] [float] NULL,
[npsp__Number_of_Soft_Credits_Last_Year__c] [float] NULL,
[npsp__Number_of_Soft_Credits_This_Year__c] [float] NULL,
[npsp__Number_of_Soft_Credits_Two_Years_Ago__c] [float] NULL,
[npsp__Number_of_Soft_Credits__c] [float] NULL,
[npsp__Primary_Affiliation__c] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npsp__Primary_Contact__c] [bit] NULL,
[npsp__Soft_Credit_Last_N_Days__c] [float] NULL,
[npsp__is_Address_Override__c] [bit] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Contact] ADD CONSTRAINT [pk_Contact] PRIMARY KEY NONCLUSTERED  ([Id]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IDX_LastModifiedDate] ON [dbo].[Contact] ([LastModifiedDate]) ON [PRIMARY]
GO
CREATE UNIQUE CLUSTERED INDEX [IDX_TableRowId] ON [dbo].[Contact] ([TableRowId]) ON [PRIMARY]
GO