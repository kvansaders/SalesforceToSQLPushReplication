CREATE TABLE [dbo].[NotificationToMirrorLoadProcedureMap]
(
[NotificationType] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ProcedureName] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[NotificationToMirrorLoadProcedureMap] ADD CONSTRAINT [PK__Notifica__591971B0C881ABCD] PRIMARY KEY NONCLUSTERED  ([NotificationType]) ON [PRIMARY]
GO
