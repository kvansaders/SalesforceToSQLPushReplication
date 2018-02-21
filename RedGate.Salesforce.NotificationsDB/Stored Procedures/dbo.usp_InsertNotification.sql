SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[usp_InsertNotification](@notificationType NVARCHAR(100), @entityRowId NVARCHAR(100), @lastModifiedDate DATETIME2, @jsonValues NVARCHAR(MAX)) 
AS
	DECLARE @NewIdTable TABLE(Id UNIQUEIDENTIFIER)
	DECLARE @NewId UNIQUEIDENTIFIER
	DECLARE @receivedDate DATETIME2

	SET @receivedDate = SYSUTCDATETIME()

    INSERT INTO dbo.Notifications( NotificationType, EntityRowId, LastModifiedDate, ReceivedDate, Payload) OUTPUT inserted.NotificationId INTO @NewIdTable
    VALUES  (  @notificationType, @entityRowId, @lastModifiedDate, @receivedDate, @jsonValues  )

	SELECT @NewId = Id FROM @NewIdTable

	--Placing mirror loading execution inside of try/catch to allow row to still be inserted if an error occurs.
	BEGIN TRY	

		EXEC dbo.usp_LoadNotificationToMirror @NewId, @notificationType
	END TRY
	BEGIN CATCH
			INSERT NotificationToMirrorErrorLog(ErrorMessage, NotificationId, EntityRowId, NotificationType, LastModifiedDate, ReceivedDate, Payload)
			VALUES(ERROR_MESSAGE() + ERROR_PROCEDURE(), @NewId, @entityRowId, @notificationType, @lastModifiedDate, @receivedDate, @jsonValues)
	END CATCH


    SELECT @NewId Id

GO
GRANT EXECUTE ON  [dbo].[usp_InsertNotification] TO [CRMListenerWrite]
GO
