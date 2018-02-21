CREATE TABLE [dbo].[NotificationToMirrorErrorLog]
(
[LogId] [bigint] NOT NULL IDENTITY(1, 1),
[ErrorMessage] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[NotificationId] [uniqueidentifier] NOT NULL,
[EntityRowId] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[NotificationType] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[LastModifiedDate] [datetime2] NULL,
[ReceivedDate] [datetime2] NULL,
[ProcessedDate] [datetime2] NULL,
[Payload] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[NotificationToMirrorErrorLog] ADD CONSTRAINT [PK__Notifica__5E548648D71E68FF] PRIMARY KEY CLUSTERED  ([LogId]) ON [PRIMARY]
GO
