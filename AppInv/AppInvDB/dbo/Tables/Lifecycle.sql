/****** Lifecycle lookup ********/
CREATE TABLE [dbo].[Lifecycle](
	[LifecycleID] [int] IDENTITY(1,1) NOT NULL,
	[Deleted] [bit] CONSTRAINT [DF_Lifecycle_Deleted] DEFAULT (0) NOT NULL,
	[CreatedBy] [nvarchar](30) NOT NULL,
	[ModifiedBy] [nvarchar](30) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[Lifecycle] [nvarchar](50) CONSTRAINT [DF_Lifecycle_Lifecycle] DEFAULT (0) NOT NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Lifecycle] PRIMARY KEY CLUSTERED ([LifecycleID] ASC)
 );