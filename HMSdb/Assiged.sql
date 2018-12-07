USE [HMS]
GO

/****** Object:  Table [dbo].[Assigned]    Script Date: 12/6/2018 8:30:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Assigned](
	[AssignID] [int] NOT NULL,
	[ComplainID] [int] NOT NULL,
	[AssignTo] [nvarchar](max) NULL,
	[Date] [date] NULL,
	[AssignedBy] [nvarchar](max) NULL,
 CONSTRAINT [PK_Assigned] PRIMARY KEY CLUSTERED 
(
	[AssignID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

ALTER TABLE [dbo].[Assigned]  WITH CHECK ADD  CONSTRAINT [FK_Assigned_Complain1] FOREIGN KEY([ComplainID])
REFERENCES [dbo].[Complain] ([ComplainID])
GO

ALTER TABLE [dbo].[Assigned] CHECK CONSTRAINT [FK_Assigned_Complain1]
GO


