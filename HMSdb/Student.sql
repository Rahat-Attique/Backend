/*
   Friday, November 30, 201811:53:08 AM
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
ALTER TABLE dbo.Employee
	DROP CONSTRAINT FK_Employee_Login
GO
ALTER TABLE dbo.Student
	DROP CONSTRAINT FK_Student_Login
GO
ALTER TABLE dbo.Login SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.Login', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.Login', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.Login', 'Object', 'CONTROL') as Contr_Per BEGIN TRANSACTION
GO
CREATE TABLE dbo.Tmp_Employee
	(
	EmployeeID int NOT NULL IDENTITY (1, 1),
	Name nvarchar(MAX) NULL,
	Designation nvarchar(MAX) NULL,
	CNIC nvarchar(MAX) NULL,
	Cell nvarchar(MAX) NULL,
	Address nvarchar(MAX) NULL,
	LoginID int NULL
	)  ON [PRIMARY]
	 TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE dbo.Tmp_Employee SET (LOCK_ESCALATION = TABLE)
GO
SET IDENTITY_INSERT dbo.Tmp_Employee ON
GO
IF EXISTS(SELECT * FROM dbo.Employee)
	 EXEC('INSERT INTO dbo.Tmp_Employee (EmployeeID, Name, Designation, CNIC, Cell, Address, LoginID)
		SELECT EmployeeID, Name, Designation, CNIC, Cell, Address, LoginID FROM dbo.Employee WITH (HOLDLOCK TABLOCKX)')
GO
SET IDENTITY_INSERT dbo.Tmp_Employee OFF
GO
DROP TABLE dbo.Employee
GO
EXECUTE sp_rename N'dbo.Tmp_Employee', N'Employee', 'OBJECT' 
GO
ALTER TABLE dbo.Employee ADD CONSTRAINT
	PK_Employee PRIMARY KEY CLUSTERED 
	(
	EmployeeID
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

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
COMMIT
select Has_Perms_By_Name(N'dbo.Employee', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.Employee', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.Employee', 'Object', 'CONTROL') as Contr_Per BEGIN TRANSACTION
GO
CREATE TABLE dbo.Tmp_Department
	(
	DepartmentID int NOT NULL IDENTITY (1, 1),
	Name nvarchar(MAX) NULL
	)  ON [PRIMARY]
	 TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE dbo.Tmp_Department SET (LOCK_ESCALATION = TABLE)
GO
SET IDENTITY_INSERT dbo.Tmp_Department ON
GO
IF EXISTS(SELECT * FROM dbo.Department)
	 EXEC('INSERT INTO dbo.Tmp_Department (DepartmentID, Name)
		SELECT DepartmentID, Name FROM dbo.Department WITH (HOLDLOCK TABLOCKX)')
GO
SET IDENTITY_INSERT dbo.Tmp_Department OFF
GO
ALTER TABLE dbo.Student
	DROP CONSTRAINT FK_Student_Department
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
select Has_Perms_By_Name(N'dbo.Department', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.Department', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.Department', 'Object', 'CONTROL') as Contr_Per BEGIN TRANSACTION
GO
CREATE TABLE dbo.Tmp_Student
	(
	StudentID int NOT NULL IDENTITY (1, 1),
	Name nvarchar(MAX) NULL,
	RegistrationNumber nvarchar(MAX) NULL,
	DepartmentID int NOT NULL,
	Session nvarchar(MAX) NULL,
	PhoneNumber nvarchar(MAX) NULL,
	Address nvarchar(MAX) NULL,
	LoginID int NOT NULL,
	Status bit NULL,
	DOB date NOT NULL
	)  ON [PRIMARY]
	 TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE dbo.Tmp_Student SET (LOCK_ESCALATION = TABLE)
GO
SET IDENTITY_INSERT dbo.Tmp_Student ON
GO
IF EXISTS(SELECT * FROM dbo.Student)
	 EXEC('INSERT INTO dbo.Tmp_Student (StudentID, Name, RegistrationNumber, DepartmentID, Session, PhoneNumber, Address, LoginID, Status, DOB)
		SELECT StudentID, Name, RegistrationNumber, DepartmentID, Session, PhoneNumber, Address, LoginID, Status, DOB FROM dbo.Student WITH (HOLDLOCK TABLOCKX)')
GO
SET IDENTITY_INSERT dbo.Tmp_Student OFF
GO
ALTER TABLE dbo.Student
	DROP CONSTRAINT FK_Student_Student
GO
ALTER TABLE dbo.Allotment
	DROP CONSTRAINT FK_Allotment_Student
GO
DROP TABLE dbo.Student
GO
EXECUTE sp_rename N'dbo.Tmp_Student', N'Student', 'OBJECT' 
GO
ALTER TABLE dbo.Student ADD CONSTRAINT
	PK_Student PRIMARY KEY CLUSTERED 
	(
	StudentID
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.Student ADD CONSTRAINT
	FK_Student_Department FOREIGN KEY
	(
	DepartmentID
	) REFERENCES dbo.Department
	(
	DepartmentID
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
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
ALTER TABLE dbo.Student ADD CONSTRAINT
	FK_Student_Student FOREIGN KEY
	(
	StudentID
	) REFERENCES dbo.Student
	(
	StudentID
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
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