/****** ApplicationHeader *******/
CREATE TABLE [dbo].[ApplicationHeader](
	[ApplicationHeaderID] [int] IDENTITY(1,1) NOT NULL,
	[Deleted] [bit] CONSTRAINT [DF_ApplicationHeader_Deleted] DEFAULT (0) NOT NULL,
	[CreatedBy] [nvarchar](30) NOT NULL,
	[ModifiedBy] [nvarchar](30) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[ApplicationID] [nvarchar](50) NULL,
	[ApplicationName] [nvarchar](150) NULL,
	[ApplicationType] [nvarchar](20) NULL,
	[ApplicationCost] [float](12) NULL,
	[ApplicationDescription] [nvarchar](max) NULL,
	[ITOwnerID] INT NULL,
	[BusinessOwnerID] INT NULL,
	[Organization] [nvarchar](100) NULL,
	[CategoryID] INT NULL,  /** Lookup **/
	[StatusID] INT NULL, /** Lookup **/
	[Recommendation] [nvarchar](100) NULL,
	[RecommendationDate] [datetime] NULL,
	[RecommendationComments] [nvarchar](max) NULL,
	[DISOClassificationID] INT NULL, /** Lookup **/
	[PII] bit CONSTRAINT [DF_ApplicationHeader_PII] DEFAULT (0) NOT NULL,  /* Yes (1) or No (0) default is No */
	[BusinessProcessArea] [nvarchar](100) NULL,
	[BusinessCriticalityID] INT NULL,  /** Lookup **/
	[servicedByExternalOrg] [nvarchar](100) NULL,  /** Lookup **/
	[SendToSom] [bit] CONSTRAINT [DF_ApplicationHeader_SendToSOM] DEFAULT (0) NOT NULL,
 CONSTRAINT [PK_ApplicationHeader] PRIMARY KEY CLUSTERED ([ApplicationHeaderID] ASC),
 CONSTRAINT [CK_AH_Category] FOREIGN KEY([CategoryID]) REFERENCES [dbo].[Category] ([CategoryID]),
 CONSTRAINT [CK_AH_ITOwner] FOREIGN KEY([ITOwnerID]) REFERENCES [dbo].[Person] ([PersonID]),
 CONSTRAINT [CK_AH_BusinessOwner] FOREIGN KEY([BusinessOwnerID]) REFERENCES [dbo].[Person] ([PersonID]),
 CONSTRAINT [CK_AH_DISOClassification] FOREIGN KEY([DISOClassificationID]) REFERENCES [dbo].[DISOClassification] ([DISOClassificationID]),
 CONSTRAINT [CK_AH_Status] FOREIGN KEY([StatusID]) REFERENCES [dbo].[Status] ([StatusID]),
 CONSTRAINT [CK_AH_BusinessCriticality] FOREIGN KEY([BusinessCriticalityID]) REFERENCES [dbo].[BusinessCriticality] ([BusinessCriticalityID]),
 );

