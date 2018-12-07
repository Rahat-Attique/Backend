/*
   Friday, November 30, 20182:43:31 PM
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
CREATE TABLE dbo.Tmp_Login
	(
	LoginID int NOT NULL IDENTITY (1, 1),
	Email nvarchar(MAX) NULL,
	Password nvarchar(MAX) NULL,
	Type nvarchar(MAX) NULL
	)  ON [PRIMARY]
	 TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE dbo.Tmp_Login SET (LOCK_ESCALATION = TABLE)
GO
SET IDENTITY_INSERT dbo.Tmp_Login ON
GO
IF EXISTS(SELECT * FROM dbo.Login)
	 EXEC('INSERT INTO dbo.Tmp_Login (LoginID, Email, Password, Type)
		SELECT LoginID, Email, Password, Type FROM dbo.Login WITH (HOLDLOCK TABLOCKX)')
GO
SET IDENTITY_INSERT dbo.Tmp_Login OFF
GO
ALTER TABLE dbo.Employee
	DROP CONSTRAINT FK_Employee_Login
GO
ALTER TABLE dbo.Student
	DROP CONSTRAINT FK_Student_Login
GO
DROP TABLE dbo.Login
GO
EXECUTE sp_rename N'dbo.Tmp_Login', N'Login', 'OBJECT' 
GO
ALTER TABLE dbo.Login ADD CONSTRAINT
	PK_Login PRIMARY KEY CLUSTERED 
	(
	LoginID
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
COMMIT
select Has_Perms_By_Name(N'dbo.Login', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.Login', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.Login', 'Object', 'CONTROL') as Contr_Per BEGIN TRANSACTION
GO
ALTER TABLE dbo.Student ADD CONSTRAINT
	FK_Student_Login FOREIGN KEY
	(
	LoginID
	) REFERENCES dbo.Login
	(
	LoginID
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.Student SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.Student', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.Student', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.Student', 'Object', 'CONTROL') as Contr_Per BEGIN TRANSACTION
GO
ALTER TABLE dbo.Employee ADD CONSTRAINT
	FK_Employee_Login FOREIGN KEY
	(
	LoginID
	) REFERENCES dbo.Login
	(
	LoginID
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.Employee SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.Employee', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.Employee', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.Employee', 'Object', 'CONTROL') as Contr_Per 