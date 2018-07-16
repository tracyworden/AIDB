/****** DISOClassification *******/
CREATE TABLE [dbo].[DISOClassification](
	[DISOClassificationID] [int] IDENTITY(1,1) NOT NULL,
	[Deleted] [bit] NOT NULL,
	[CreatedBy] [nvarchar](30) NOT NULL,
	[ModifiedBy] [nvarchar](30) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[DISOClassification] [nvarchar](50) CONSTRAINT [DF_DISOClassification_DISOClassification] DEFAULT (0) NOT NULL,
	[Description] [nvarchar](max) NULL
 CONSTRAINT [PK_DISOClassification] PRIMARY KEY CLUSTERED 
(
	[DISOClassificationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[DISOClassification] ADD  CONSTRAINT [DF_DISOClassification_Deleted]  DEFAULT ((0)) FOR [Deleted]