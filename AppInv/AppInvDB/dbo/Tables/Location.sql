/****** Location *******/
CREATE TABLE [dbo].[Location](
	[LocationID] [int] IDENTITY(1,1) NOT NULL,
	[Deleted] [bit] CONSTRAINT [DF_Location_Deleted] DEFAULT (0) NOT NULL,
	[CreatedBy] [nvarchar](30) NOT NULL,
	[ModifiedBy] [nvarchar](30) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[Name] [nvarchar](100) NULL,
	[Description] [nvarchar](200) NULL,
	[Region] [nvarchar](50) NULL,
	[Type] [nvarchar](15) NULL,
	[Contact] [nvarchar](32) NULL,
	[Address] [nvarchar](50) NULL,
	[City] [float](30) NULL,
	[Country] [nvarchar](30) NULL,
	[PostalCode] [nvarchar](30) NULL,
 CONSTRAINT [PK_Location] PRIMARY KEY CLUSTERED ([LocationID] ASC)
 );