/****** Category *******/
CREATE TABLE [dbo].[Category](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[ParentCategoryID] [int] NULL,
	[ChildCategoryID] [int] NULL,
	[Deleted] [bit] CONSTRAINT [DF_Category_Deleted] DEFAULT (0) NOT NULL,
	[CreatedBy] [nvarchar](30) NOT NULL,
	[ModifiedBy] [nvarchar](30) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[Category] [nvarchar](50) CONSTRAINT [DF_Category_Category] DEFAULT (0) NOT NULL,
	[Description] [nvarchar](max) NULL,
 	CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED ([CategoryID] ASC)
);
