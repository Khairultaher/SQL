IF EXISTS(SELECT * FROM sysobjects WHERE type = 'P' and name = 'ProsedureName')
BEGIN
   DROP PROCEDURE ProsedureName
END
GO
CREATE PROCEDURE [dbo].ProsedureName
(
  @pCustomerId int
)
-- WITH ENCRYPTION
AS
/*
--------------------------------------------------------------------------------
	Write/Modified By        : 
	Create/Modification date : 25-01-2017
	Case/Bug/CR No           : N/A
	Description              : 
---------------Please add change History here ------------------------------------
	Write/Modified By        : 
	Create/Modification date : 2017-08-20
	Case/Bug/CR No           : N/A
	Description              : 
---------------Please add change History here ------------------------------------
*/
BEGIN TRY

    SET NOCOUNT ON;
--    SET DATEFORMAT dmy;

	/* Reassign the input parameters to local variable  */
	DECLARE @CustomerId int = @pCustomerId

	/* Begin Transaction if required */
	DECLARE @TransactionCount INT =0
	SELECT @TransactionCount = @@TRANCOUNT
	
	IF @TransactionCount < 1
		BEGIN
			BEGIN TRANSACTION
			SET  @TransactionCount = 1
		END
	ELSE
		BEGIN
			SET  @TransactionCount = 0
		END

    -- Commit Transaction if exist
	IF (@TransactionCount = 1)
	BEGIN
		COMMIT TRANSACTION 
		SET @TransactionCount = 0		
    END
END TRY
BEGIN CATCH
	DECLARE @ErrorNumber NVARCHAR(MAX)   = CAST( ISNULL(ERROR_NUMBER(), '') AS NVARCHAR(MAX))
	DECLARE @ErrorSeverity NVARCHAR(MAX) = CAST( ISNULL(ERROR_SEVERITY(), '') AS NVARCHAR(MAX))
	DECLARE @ErrorState NVARCHAR(MAX)    =  CAST( ISNULL(ERROR_STATE(), '') AS NVARCHAR(MAX))
	DECLARE @ErrorProsedure NVARCHAR(MAX)=  CAST( ISNULL(ERROR_PROCEDURE(), '') AS NVARCHAR(MAX))
	DECLARE @ErrorLine NVARCHAR(MAX)     =  CAST( ISNULL(ERROR_LINE(), '') AS NVARCHAR(MAX))
	DECLARE @ErrorMessage NVARCHAR(MAX)  = CAST( ISNULL(ERROR_MESSAGE(), '') AS NVARCHAR(MAX))

    IF @TransactionCount = 1
		BEGIN
			ROLLBACK TRANSACTION

			SELECT 'Failure' as Status, 'ErrorNumber :' + @ErrorNumber + ', ErrorState : '  + @ErrorState+ ', ErrorProcedure : '  
			      + @ErrorProsedure+ ', ErrorLine : '  + @ErrorLine + ', ErrorMessage : '  + @ErrorMessage as Details;
		END
	ELSE
		BEGIN
		     DECLARE @ErrPross NVARCHAR(MAX) = @ErrorMessage + ', ' + @ErrorProsedure
			 RAISERROR (@ErrPross,@ErrorSeverity,@ErrorState)
		END

END CATCH
