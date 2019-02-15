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

	/* Transaction if required */
	BEGIN TRAN;
	COMMIT TRAN;
END TRY
BEGIN CATCH
      IF @@TRANCOUNT > 0
      ROLLBACK TRANSACTION;

	   /* If error occured the will show this message */
        SELECT 'ErrorNumber :' + CAST(ERROR_NUMBER() AS varchar(max)) 
		+ ', ErrorState : '  + CAST( ERROR_STATE() AS varchar(max))
		+ ', ErrorProcedure : '  + CAST( ERROR_PROCEDURE() AS varchar(max))
		+ ', ErrorLine : '  + CAST( ERROR_LINE() AS varchar(max))
		+ ', ErrorMessage : '  + CAST( ERROR_MESSAGE() AS varchar(max));

END CATCH


