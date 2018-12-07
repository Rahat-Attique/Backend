/*
   Wednesday, November 28, 201810:39:12 PM
   User: 
   Server: hi
   Database: HMS
   Application: 
*/

/* To prevent any potential data loss issues, you should review this script in detail before running it outside the context of the database designer.*/
BEGIN TRANSACTION
SET QUOTED_IDENTIFIER ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.Tmp_Department
	(
	DepartmentID int NOT NULL,
	Name nvarchar(MAX) NULL
	)  ON [PRIMARY]
	 TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE dbo.Tmp_Department SET (LOCK_ESCALATION = TABLE)
GO
IF EXISTS(SELECT * FROM dbo.Department)
	 EXEC('INSERT INTO dbo.Tmp_Department (DepartmentID, Name)
		SELECT DepartmentID, Name FROM dbo.Department WITH (HOLDLOCK TABLOCKX)')
GO
DROP TABLE dbo.Department
GO
EXECUTE sp_rename N'dbo.Tmp_Department', N'Department', 'OBJECT' 
GO
ALTER TABLE dbo.Department ADD CONSTRAINT
	PK_Department PRIMARY KEY CLUSTERED 
	(
	DepartmentID
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
COMMIT
select Has_Perms_By_Name(N'dbo.Department', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.Department', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.Department', 'Object', 'CONTROL') as Contr_Per 