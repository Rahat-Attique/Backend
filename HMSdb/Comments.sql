USE [HMS]
GO

/****** Object:  Table [dbo].[Comments]    Script Date: 12/6/2018 10:12:42 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Comments](
	[CommentID] [int] NOT NULL,
	[Comment] [nvarchar](max) NULL,
	[Date] [date] NULL,
	[CommentedBy] [nvarchar](max) NULL,
	[ComplainID] [int] NOT NULL,
 CONSTRAINT [PK_Comments] PRIMARY KEY CLUSTERED 
(
	[CommentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Complain] FOREIGN KEY([ComplainID])
REFERENCES [dbo].[Complain] ([ComplainID])
GO

ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Complain]
GO


