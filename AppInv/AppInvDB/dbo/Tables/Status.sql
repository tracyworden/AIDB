/****** Status lookup*******/
CREATE TABLE [dbo].[Status](
	[StatusID] [int] IDENTITY(1,1) NOT NULL,
	[Deleted] [bit] CONSTRAINT [DF_Status_Deleted] DEFAULT (0) NOT NULL,
	[CreatedBy] [nvarchar](30) NOT NULL,
	[ModifiedBy] [nvarchar](30) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[Status] [nvarchar](50) CONSTRAINT [DF_Status_Status] DEFAULT (0) NOT NULL,
	[Description] [nvarchar](max) NULL,
	CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED ([StatusID] ASC)
	);