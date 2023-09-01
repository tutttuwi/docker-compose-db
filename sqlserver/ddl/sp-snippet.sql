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


/***********************************
 *  Check Disk Usage
 ************************************/

/*
use dbname;
CREATE TABLE #DiskUsageByTables (
	name		NVARCHAR(128),
	rows		CHAR(11),
	reserved	VARCHAR(18),
	data		VARCHAR(18),
	index_size	VARCHAR(18),
	unused		VARCHAR(18)
);

INSERT INTO #DiskUsageByTables
	exec ACCOUNT..sp_MSforeachtable 'sp_spaceused ''?'''

SELECT * FROM #DiskUsageByTables ORDER BY name

DROP TABLE #DiskUsageByTables

*/

/***********************************
 *  Clean Fragmentation
 ***********************************/
/*
use dbname;
declare @DB_NAME VARCHAR(30)		= 'DB NAME HERE!'
declare @SCHEMA_NAME VARCHAR(30)		= 'SCHEMA NAME HERE!'
declare @QUERY VARCHAR(max)		= '
SELECT 
    a.object_id, 
    c.name AS TableName,
    b.name AS IndexName,
    avg_fragmentation_in_percent, ' + 
    ''' ALTER INDEX ALL ON ' + @DB_NAME + '.' + @SCHEMA_NAME + '.'' + c.name + '' REBUILD WITH(ONLINE = ON);''' + ' AS REBUILD_QUERY
    FROM sys.dm_db_index_physical_stats(DB_ID(N''' + @DB_NAME + '''),NULL,NULL,NULL,NULL) AS a
    INNER JOIN ' + @DB_NAME + '.sys.indexes AS b
    ON a.object_id = b.object_id AND a.index_id = b.index_id
    INNER JOIN ' + @DB_NAME + '.sys.tables AS c
    ON b.object_id = c.object_id
    ORDER BY avg_fragmentation_in_percent desc
    ;
'
PRINT @QUERY;
EXEC(@QUERY);

*/





