USE [HostelProject]
GO
/****** Object:  Table [dbo].[ApprovedStudent]    Script Date: 30-Aug-17 7:16:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApprovedStudents](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	phoneNumber nvarchar(50) NULL,
	CNIC nvarchar(50) NULL,
	Department nvarchar(50) NULL,
	Degree nvarchar(50) NULL,
	RegistrationNumber nvarchar(50) NULL,
	HostelName nvarchar(50) NULL,
	RoomNumber nvarchar(MAX) NULL,
	[IsValid] [bit] NULL
 CONSTRAINT [PK_ApprovedStudents] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
