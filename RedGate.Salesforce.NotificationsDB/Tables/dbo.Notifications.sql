CREATE TABLE [dbo].[Notifications]
(
[NotificationId] [uniqueidentifier] NOT NULL CONSTRAINT [DF__Notificat__Notif__2F10007B] DEFAULT(newsequentialid()),
[EntityRowId] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[NotificationType] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[LastModifiedDate] [datetime2] NOT NULL,
[ReceivedDate] [datetime2] NOT NULL,
[ProcessedDate] [datetime2] NULL,
[Payload] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Notifications] ADD CONSTRAINT [pk_Notifications] PRIMARY KEY CLUSTERED  ([NotificationId]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [idx_LastModifiedDate] ON [dbo].[Notifications] ([LastModifiedDate]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [idx_NotificationType] ON [dbo].[Notifications] ([NotificationType]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [idx_NotificationType_EntityRowId] ON [dbo].[Notifications] ([NotificationType], [EntityRowId]) ON [PRIMARY]
GO
