/*
   Thursday, December 6, 20181:00:13 PM
   User: 
   Server: DESKTOP-4CTJEVU\SQLEXPRESS
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
CREATE TABLE dbo.Tmp_Status
	(
	StatusID int NOT NULL IDENTITY (1, 1),
	StatusName nvarchar(MAX) NULL,
	Date date NULL
	)  ON [PRIMARY]
	 TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE dbo.Tmp_Status SET (LOCK_ESCALATION = TABLE)
GO
SET IDENTITY_INSERT dbo.Tmp_Status ON
GO
IF EXISTS(SELECT * FROM dbo.Status)
	 EXEC('INSERT INTO dbo.Tmp_Status (StatusID, StatusName, Date)
		SELECT StatusID, StatusName, Date FROM dbo.Status WITH (HOLDLOCK TABLOCKX)')
GO
SET IDENTITY_INSERT dbo.Tmp_Status OFF
GO
DROP TABLE dbo.Status
GO
EXECUTE sp_rename N'dbo.Tmp_Status', N'Status', 'OBJECT' 
GO
ALTER TABLE dbo.Status ADD CONSTRAINT
	PK_Status PRIMARY KEY CLUSTERED 
	(
	StatusID
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
COMMIT
select Has_Perms_By_Name(N'dbo.Status', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.Status', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.Status', 'Object', 'CONTROL') as Contr_Per 