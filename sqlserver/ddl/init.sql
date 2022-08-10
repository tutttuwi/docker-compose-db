USE master;
DECLARE @SQL nvarchar(256);
IF EXISTS (SELECT 1 FROM sys.databases(NOLOCK) WHERE [name] = N'todo') BEGIN SET @SQL = N'ALTER DATABASE todo SET SINGLE_USER WITH ROLLBACK IMMEDIATE; DROP DATABASE todo;'; EXEC(@SQL); END;
IF EXISTS (SELECT 1 FROM sys.databases(NOLOCK) WHERE [name] = N'AdventureWorks2012') BEGIN SET @SQL = N'ALTER DATABASE AdventureWorks2012 SET SINGLE_USER WITH ROLLBACK IMMEDIATE; DROP DATABASE AdventureWorks2012;'; EXEC(@SQL); END;

/*
CREATE DATABASE
*/
CREATE DATABASE todo;
GO
USE todo;
GO
CREATE SCHEMA it;
GO

CREATE TABLE it.TODO(
  todo_id INT NOT NULL IDENTITY(1, 1) PRIMARY KEY,
  title VARCHAR(256) NULL,
  detail VARCHAR(800) NULL,
  created_dt datetime2 NULL,
  created_user VARCHAR(128) NULL,
  updated_dt datetime2 NULL,
  updated_user VARCHAR(128) NULL
);

USE [todo]
GO

SET IDENTITY_INSERT it.TODO ON
INSERT INTO [it].[TODO](todo_id,title,detail,created_dt,created_user,updated_dt,updated_user) VALUES(1,'TODOタイトル','TODO説明',GETDATE(),'createUserName',GETDATE(),'updateUserName')
SET STATISTICS PROFILE ON
SELECT * FROM todo.it.TODO AS TODO(NOLOCK) WHERE title = ''


CREATE DATABASE AdventureWorks2012;
GO

USE AdventureWorks2012;

/*
int、bigint、smallint、および tinyint (Transact-SQL)
<https://docs.microsoft.com/ja-jp/sql/t-sql/data-types/int-bigint-smallint-and-tinyint-transact-sql?view=sql-server-ver16>
*/
CREATE TABLE AdventureWorks2012.dbo.MyTable (
	MyBigIntColumn BIGINT, 
	MyIntColumn INT, 
	MySmallIntColumn SMALLINT, 
	MyTinyIntColumn TINYINT
);

GO
INSERT INTO
  AdventureWorks2012.dbo.MyTable
VALUES
  (9223372036854775807, 2147483647, 32767, 255);

GO
SELECT
  MyBigIntColumn,
  MyIntColumn,
  MySmallIntColumn,
  MyTinyIntColumn
FROM
  AdventureWorks2012.dbo.MyTable;