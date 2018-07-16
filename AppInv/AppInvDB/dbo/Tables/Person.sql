/****** Person Lookup *******/
CREATE TABLE [dbo].[Person](
	[PersonID] [int] IDENTITY(1,1) NOT NULL,
	[Deleted] [bit] CONSTRAINT [DF_Person_Deleted] DEFAULT (0) NOT NULL,
	[CreatedBy] [nvarchar](30) NOT NULL,
	[ModifiedBy] [nvarchar](30) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[Name] [nvarchar](100) NULL,
	[Description] [nvarchar](250) NULL,
	[EmailAddress] [nvarchar](200) NULL,
	[role] [nvarchar](50) NULL
 CONSTRAINT [PK_Person] PRIMARY KEY CLUSTERED ([PersonID] ASC)
 );
