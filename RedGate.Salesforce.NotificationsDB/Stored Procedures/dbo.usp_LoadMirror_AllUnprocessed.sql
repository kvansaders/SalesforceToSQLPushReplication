SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[usp_LoadMirror_AllUnprocessed]
AS

DECLARE @notificationId UNIQUEIDENTIFIER
DECLARE @notificationType NVARCHAR(100)
DECLARE @entityRowId NVARCHAR(100)

DECLARE cr CURSOR FAST_FORWARD
FOR SELECT NotificationId, NotificationType, EntityRowId FROM dbo.Notifications WHERE ProcessedDate IS NULL
 
OPEN cr
FETCH NEXT FROM cr INTO @notificationId, @notificationType, @entityRowId
WHILE @@FETCH_STATUS=0
BEGIN
    BEGIN TRY	
		PRINT 'attempting ' + CONVERT(NVARCHAR(100), @notificationId)
		EXEC dbo.usp_LoadNotificationToMirror @notificationId, @notificationType
		PRINT 'Success ' + CONVERT(NVARCHAR(100), @notificationId)
	END TRY
	BEGIN CATCH
			PRINT 'error in :' + CONVERT(NVARCHAR(100), @notificationId) + ERROR_MESSAGE()
			INSERT NotificationToMirrorErrorLog(ErrorMessage, NotificationId, EntityRowId, NotificationType)
			VALUES(ERROR_MESSAGE() + ERROR_PROCEDURE(), @notificationId, @entityRowId, @notificationType)
	END CATCH
    FETCH NEXT FROM cr into @notificationId, @notificationType, @entityRowId
END
CLOSE cr
DEALLOCATE cr
GO
GRANT EXECUTE ON  [dbo].[usp_LoadMirror_AllUnprocessed] TO [CRMListenerWrite]
GO
