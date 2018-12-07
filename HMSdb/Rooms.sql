/*
   Thursday, December 6, 20181:00:32 PM
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
CREATE TABLE dbo.Tmp_Hostel
	(
	HostelID int NOT NULL IDENTITY (1, 1),
	hostelName nvarchar(MAX) NULL,
	Category nvarchar(50) NULL
	)  ON [PRIMARY]
	 TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE dbo.Tmp_Hostel SET (LOCK_ESCALATION = TABLE)
GO
SET IDENTITY_INSERT dbo.Tmp_Hostel ON
GO
IF EXISTS(SELECT * FROM dbo.Hostel)
	 EXEC('INSERT INTO dbo.Tmp_Hostel (HostelID, hostelName, Category)
		SELECT HostelID, hostelName, Category FROM dbo.Hostel WITH (HOLDLOCK TABLOCKX)')
GO
SET IDENTITY_INSERT dbo.Tmp_Hostel OFF
GO
ALTER TABLE dbo.Hostel
	DROP CONSTRAINT FK_Hostel_Hostel
GO
ALTER TABLE dbo.Rooms
	DROP CONSTRAINT FK_Rooms_Hostel
GO
DROP TABLE dbo.Hostel
GO
EXECUTE sp_rename N'dbo.Tmp_Hostel', N'Hostel', 'OBJECT' 
GO
ALTER TABLE dbo.Hostel ADD CONSTRAINT
	PK_Hostel PRIMARY KEY CLUSTERED 
	(
	HostelID
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.Hostel ADD CONSTRAINT
	FK_Hostel_Hostel FOREIGN KEY
	(
	HostelID
	) REFERENCES dbo.Hostel
	(
	HostelID
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
COMMIT
select Has_Perms_By_Name(N'dbo.Hostel', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.Hostel', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.Hostel', 'Object', 'CONTROL') as Contr_Per BEGIN TRANSACTION
GO
CREATE TABLE dbo.Tmp_Rooms
	(
	RoomID int NOT NULL IDENTITY (1, 1),
	RoomNo nvarchar(MAX) NULL,
	Details nvarchar(MAX) NULL,
	Capacity int NULL,
	HostelID int NOT NULL
	)  ON [PRIMARY]
	 TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE dbo.Tmp_Rooms SET (LOCK_ESCALATION = TABLE)
GO
SET IDENTITY_INSERT dbo.Tmp_Rooms ON
GO
IF EXISTS(SELECT * FROM dbo.Rooms)
	 EXEC('INSERT INTO dbo.Tmp_Rooms (RoomID, RoomNo, Details, Capacity, HostelID)
		SELECT RoomID, RoomNo, Details, Capacity, HostelID FROM dbo.Rooms WITH (HOLDLOCK TABLOCKX)')
GO
SET IDENTITY_INSERT dbo.Tmp_Rooms OFF
GO
ALTER TABLE dbo.Allotment
	DROP CONSTRAINT FK_Allotment_Rooms
GO
DROP TABLE dbo.Rooms
GO
EXECUTE sp_rename N'dbo.Tmp_Rooms', N'Rooms', 'OBJECT' 
GO
ALTER TABLE dbo.Rooms ADD CONSTRAINT
	PK_Rooms PRIMARY KEY CLUSTERED 
	(
	RoomID
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.Rooms ADD CONSTRAINT
	FK_Rooms_Hostel FOREIGN KEY
	(
	HostelID
	) REFERENCES dbo.Hostel
	(
	HostelID
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
COMMIT
select Has_Perms_By_Name(N'dbo.Rooms', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.Rooms', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.Rooms', 'Object', 'CONTROL') as Contr_Per BEGIN TRANSACTION
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
ALTER TABLE dbo.Allotment SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.Allotment', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.Allotment', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.Allotment', 'Object', 'CONTROL') as Contr_Per 