/****** Software ****&***/
CREATE TABLE [dbo].[Software](
	[SoftwareID] [int] IDENTITY(1,1) NOT NULL,
	[ApplicationInstanceID] [int] NOT NULL,  /*FK*/
	[Deleted] [bit] CONSTRAINT [DF_Software_Deleted] DEFAULT (0) NOT NULL,
	[CreatedBy] [nvarchar](30) NOT NULL,
	[ModifiedBy] [nvarchar](30) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[Name] [nvarchar](50) NULL,
	[Version] [nvarchar](25) NULL,
	[License] [nvarchar](100) NULL,
	[LicenseBy] [nvarchar](50) NULL,
	[Contact] [nvarchar](32) NULL,
	[Type] [nvarchar](20) NULL,
	[Cost] [float](10) NULL
	CONSTRAINT [PK_Software] PRIMARY KEY CLUSTERED ([SoftwareID] ASC),
	CONSTRAINT [FK_FK_Software_ApplicationInstanceID] FOREIGN KEY([ApplicationInstanceID]) REFERENCES [dbo].[ApplicationInstance] ([ApplicationInstanceID]) ON DELETE CASCADE
	);
