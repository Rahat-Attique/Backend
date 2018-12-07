/*
   Friday, November 30, 20183:18:35 PM
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
ALTER TABLE dbo.Allotment
	DROP CONSTRAINT FK_Allotment_Rooms
GO
ALTER TABLE dbo.Rooms SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.Rooms', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.Rooms', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.Rooms', 'Object', 'CONTROL') as Contr_Per BEGIN TRANSACTION
GO
ALTER TABLE dbo.Allotment
	DROP CONSTRAINT FK_Allotment_Student
GO
ALTER TABLE dbo.Student SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.Student', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.Student', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.Student', 'Object', 'CONTROL') as Contr_Per BEGIN TRANSACTION
GO
CREATE TABLE dbo.Tmp_Allotment
	(
	AllotmentID int NOT NULL IDENTITY (1, 1),
	StudentID int NOT NULL,
	RoomID int NOT NULL,
	Status bit NULL,
	DateOfAllotment date NULL,
	DateOfRele date NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Tmp_Allotment SET (LOCK_ESCALATION = TABLE)
GO
SET IDENTITY_INSERT dbo.Tmp_Allotment ON
GO
IF EXISTS(SELECT * FROM dbo.Allotment)
	 EXEC('INSERT INTO dbo.Tmp_Allotment (AllotmentID, StudentID, RoomID, Status, DateOfAllotment, DateOfRele)
		SELECT AllotmentID, StudentID, RoomID, Status, DateOfAllotment, DateOfRele FROM dbo.Allotment WITH (HOLDLOCK TABLOCKX)')
GO
SET IDENTITY_INSERT dbo.Tmp_Allotment OFF
GO
DROP TABLE dbo.Allotment
GO
EXECUTE sp_rename N'dbo.Tmp_Allotment', N'Allotment', 'OBJECT' 
GO
ALTER TABLE dbo.Allotment ADD CONSTRAINT
	PK_Allotment PRIMARY KEY CLUSTERED 
	(
	AllotmentID
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.Allotment ADD CONSTRAINT
	FK_Allotment_Student FOREIGN KEY
	(
	StudentID
	) REFERENCES dbo.Student
	(
	StudentID
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.Allotment ADD CONSTRAINT
	FK_Allotment_Rooms FOREIGN KEY
	(
	RoomID
	) REFERENCES dbo.Rooms
	(
	RoomID
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
COMMIT
select Has_Perms_By_Name(N'dbo.Allotment', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.Allotment', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.Allotment', 'Object', 'CONTROL') as Contr_Per 