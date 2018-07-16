/****** LifecycleStatus *******/
CREATE TABLE [dbo].[LifecycleStatus](
	[LifecycleStatusID] [int] IDENTITY(1,1) NOT NULL,
	[ApplicationHeaderID] [int] NOT NULL,  /*FK*/
	[LifecycleID] [int] NOT NULL,  /*FK*/
	[Deleted] [bit] CONSTRAINT [DF_LifecycleStatus_Deleted] DEFAULT (0) NOT NULL,
	[CreatedBy] [nvarchar](30) NOT NULL,
	[ModifiedBy] [nvarchar](30) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[Date] [datetime] NULL,
	[Comment] [nvarchar](250) NULL,
    CONSTRAINT [PK_LifecycleStatus] PRIMARY KEY CLUSTERED ([LifecycleStatusID] ASC),
	CONSTRAINT [FK_LifecycleStatus_ApplicationHeaderID] FOREIGN KEY([ApplicationHeaderID]) REFERENCES [dbo].[ApplicationHeader] ([ApplicationHeaderID]) ON DELETE CASCADE,
	CONSTRAINT [FK_LifecycleStatus_LifecycleID] FOREIGN KEY([LifecycleID]) REFERENCES [dbo].[Lifecycle] ([LifecycleID]) ON DELETE CASCADE
);
