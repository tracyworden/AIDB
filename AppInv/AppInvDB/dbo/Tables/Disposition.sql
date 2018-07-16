/****** Disposition *******/
CREATE TABLE [dbo].[Disposition](
	[DispositionID] [int] IDENTITY(1,1) NOT NULL,
	[ApplicationHeaderID] [int] NOT NULL, /*FK*/
	[ApplicationInstanceID] [int] NULL,  /*FK*/
	[Deleted] [bit] CONSTRAINT [DF_Disposition_Deleted] DEFAULT (0) NOT NULL,
	[CreatedBy] [nvarchar](30) NOT NULL,
	[ModifiedBy] [nvarchar](30) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[SpinCoName] [nvarchar](50) NULL,
	[Disposition] [nvarchar](50) NULL,
	[Status] [nvarchar](50) NULL,
	[TestScope] [nvarchar](50) NULL,
	[WaveRelease] [nvarchar](50) NULL,
	[Comments] [nvarchar](150) NULL
    CONSTRAINT [PK_Disposition] PRIMARY KEY CLUSTERED ([DispositionID] ASC),
    CONSTRAINT [FK_Disposition_ApplicationHeaderID] FOREIGN KEY([ApplicationHeaderID]) REFERENCES [dbo].[ApplicationHeader] ([ApplicationHeaderID])
);