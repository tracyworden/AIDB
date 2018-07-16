/****** ApplicationInstance ******/
CREATE TABLE [dbo].[ApplicationInstance](
	[ApplicationInstanceID] [int] IDENTITY(1,1) NOT NULL,
	[ApplicationHeaderID] [int] NOT NULL,  /*FK*/
	[LocationID] INT NULL, /** Lookup **/
	[Deleted] [bit] CONSTRAINT [DF_ApplicationInstance_Deleted] DEFAULT (0) NOT NULL,
	[CreatedBy] [nvarchar](30) NOT NULL,
	[ModifiedBy] [nvarchar](30) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[InstanceType] [nvarchar](50) CONSTRAINT [DF_ApplicationInstance_InstanceType] DEFAULT ('PROD') NOT NULL, /* DEV, TEST, PROD*/
	[InstanceURL] [nvarchar](250) NULL, /* url */
	[InstancePlatform] [nvarchar](50) CONSTRAINT [DF_ApplicationInstance_InstancePlatform] /* SaaS, Paas, IaaS, OnPrem_VM, OnPrem_Physical */ DEFAULT ('OnPrem_VM') NOT NULL,
	[InstanceDescription] [nvarchar](150) NULL,
	[StatusID] INT NULL, /** Lookup **/
	[InstanceOwner] [nvarchar](100) NULL, 
	[NumberofUsers] [int] NULL
    CONSTRAINT [PK_ApplicationInstance] PRIMARY KEY CLUSTERED ([ApplicationInstanceID] ASC),
    CONSTRAINT [FK_FK_ApplicationInstance_ApplicationHeaderID] FOREIGN KEY([ApplicationHeaderID]) REFERENCES [dbo].[ApplicationHeader] ([ApplicationHeaderID]),
    CONSTRAINT [CK_AI_Location] FOREIGN KEY([LocationID]) REFERENCES [dbo].[Location] ([LocationID]),
    CONSTRAINT [CK_AI_Status] FOREIGN KEY([StatusID]) REFERENCES [dbo].[Status] ([StatusID])
	);