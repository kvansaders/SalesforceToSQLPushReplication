SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



CREATE PROCEDURE [dbo].[usp_LoadNotificationToMirror](@notificationId UNIQUEIDENTIFIER, @notificationType NVARCHAR(100))
AS
	DECLARE @procName NVARCHAR(250)
	DECLARE @statement NVARCHAR(500)
	DECLARE @ParamDefinition NVARCHAR(500)
	
	SELECT @procName = ProcedureName FROM NotificationToMirrorLoadProcedureMap WHERE NotificationType = @notificationType
	SET @statement = 'EXEC ' + @procName + ' @notificationId=@PNotificationId'

	IF @procName IS NOT NULL 
		EXEC sp_executesql @statement, N'@PNotificationId UNIQUEIDENTIFIER', @PNotificationId = @notificationId




GO
