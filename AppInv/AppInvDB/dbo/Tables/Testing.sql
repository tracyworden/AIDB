/****** Testing *******/
CREATE TABLE [dbo].[Testing](
	[TestingID] [int] IDENTITY(1,1) NOT NULL,
	[ApplicationInstanceId] [int] NOT NULL,  /*FK*/
	[Deleted] [bit] CONSTRAINT [DF_Testing_Deleted] DEFAULT (0) NOT NULL,
	[CreatedBy] [nvarchar](30) NOT NULL,
	[ModifiedBy] [nvarchar](30) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[TestType] [nvarchar](20) NULL,
	[TestLead] [nvarchar](32) NULL,
	[TestScope] [nvarchar](25) NULL,
	[TestWave] [nvarchar](25) NULL,
	[Comments] [nvarchar](250) NULL,
	CONSTRAINT [PK_Testing] PRIMARY KEY CLUSTERED ([TestingID] ASC),
    CONSTRAINT [FK_Testing_ApplicationInstanceId] FOREIGN KEY([ApplicationInstanceId]) REFERENCES [dbo].[ApplicationInstance] ([ApplicationInstanceID]) ON DELETE CASCADE
);

