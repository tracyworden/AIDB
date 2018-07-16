/****** BusinessCriticality *******/
CREATE TABLE [dbo].[BusinessCriticality](
	[BusinessCriticalityID] [int] IDENTITY(1,1) NOT NULL,
	[Deleted] [bit] CONSTRAINT [DF_BusinessCriticality_Deleted] DEFAULT (0) NOT NULL,
	[CreatedBy] [nvarchar](30) NOT NULL,
	[ModifiedBy] [nvarchar](30) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[BusinessCriticality] INT CONSTRAINT [DF_BusinessCriticality_BusinessCriticality] DEFAULT (0) NOT NULL,
	[Description] [nvarchar](max) NULL
 CONSTRAINT [PK_BusinessCriticality] PRIMARY KEY CLUSTERED ([BusinessCriticalityID] ASC)
 );