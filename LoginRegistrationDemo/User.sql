/*
   Saturday, November 24, 201811:30:48 AM
   User: 
   Server: HI
   Database: HostelProject
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
CREATE TABLE dbo.Tmp_User
	(
	UserID int NOT NULL IDENTITY (1, 1),
	Name nvarchar(50) NOT NULL,
	Password nchar(100) NOT NULL,
	EmailID nvarchar(MAX) NOT NULL,
	phoneNumber nvarchar(50) NULL,
	CNIC nvarchar(50) NULL,
	Department nvarchar(50) NULL,
	Degree nvarchar(50) NULL,
	RegistrationNumber nvarchar(50) NULL,
	HostelName nvarchar(50) NULL,
	RoomNumber nvarchar(MAX) NULL
	)  ON [PRIMARY]
	 TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE dbo.Tmp_User SET (LOCK_ESCALATION = TABLE)
GO
SET IDENTITY_INSERT dbo.Tmp_User ON
GO
IF EXISTS(SELECT * FROM dbo.[User])
	 EXEC('INSERT INTO dbo.Tmp_User (UserID, Name, Password, EmailID, phoneNumber, CNIC, Department, Degree, RegistrationNumber, HostelName, RoomNumber)
		SELECT UserID, Name, Password, EmailID, phoneNumber, CNIC, Department, Degree, RegistrationNumber, HostelName, CONVERT(nvarchar(MAX), RoomNumber) FROM dbo.[User] WITH (HOLDLOCK TABLOCKX)')
GO
SET IDENTITY_INSERT dbo.Tmp_User OFF
GO
DROP TABLE dbo.[User]
GO
EXECUTE sp_rename N'dbo.Tmp_User', N'User', 'OBJECT' 
GO
ALTER TABLE dbo.[User] ADD CONSTRAINT
	PK_User PRIMARY KEY CLUSTERED 
	(
	UserID
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
COMMIT
select Has_Perms_By_Name(N'dbo.[User]', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.[User]', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.[User]', 'Object', 'CONTROL') as Contr_Per 