/*
DECLARE @databaseList VARCHAR(256);

DECLARE crDatabaseList CURSOR FOR
SELECT
  name
FROM
  master.sys.databases
WHERE
  name = 'todo';

BEGIN TRY 
	OPEN crDatabaseList;

FETCH NEXT
FROM
  crDatabaseList INTO @databaseList WHILE @@FETCH_STATUS = 0 BEGIN BEGIN TRANSACTION
END
END TRY BEGIN CATCH ROLLBACK TRANSACTION CLOSE crDatabaseList DEALLOCATE crDatabaseList
SELECT
  'ERROR OCCURED!!' AS ErrorWhile,
  ERROR_NUMBER() AS ErrorNumber,
  ERROR_SEVERITY() AS ErrorSeverity,
  ERROR_STATE() AS ErrorState,
  ERROR_PROCEDURE AS ErrorProcedure,
  ERROR_LINE AS ErrorLine,
  ERROR_MESSAGE AS ErrorMessage;
  RETURN
END CATCH
*/
