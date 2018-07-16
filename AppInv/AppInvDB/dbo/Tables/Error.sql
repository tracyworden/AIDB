CREATE TABLE [dbo].[Error](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Deleted] [bit] CONSTRAINT [DF_Error_Deleted] DEFAULT (0) NOT NULL,
	[CreatedBy] [nvarchar](30) NOT NULL,
	[ModifiedBy] [nvarchar](30) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[Error] [nvarchar](100) NULL,
	[Description] [nvarchar](250) NULL,
	CONSTRAINT [PK_Error] PRIMARY KEY CLUSTERED ([id] ASC),
);
