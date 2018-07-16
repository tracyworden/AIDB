/****** Hardware *******/
CREATE TABLE [dbo].[Hardware](
	[HardwareID] [int] IDENTITY(1,1) NOT NULL,
	[ApplicationInstanceId] [int] NOT NULL,  /*FK*/
	[Deleted] [bit] CONSTRAINT [DF_Hardware_Deleted] DEFAULT (0) NOT NULL,
	[CreatedBy] [nvarchar](30) NOT NULL,
	[ModifiedBy] [nvarchar](30) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[Name] [nvarchar](50) NULL,
	[Version] [nvarchar](25) NULL,
	[License] [nvarchar](50) NULL,
	[ProvidedBy] [nvarchar](100) NULL,
	[Contact] [nvarchar](32) NULL,
	[Type] [nvarchar](50) NULL,
	[Cost] [float](10) NULL,
	[Priority] [nvarchar](15) NULL
    CONSTRAINT [PK_Hardware] PRIMARY KEY CLUSTERED ([HardwareID] ASC),
    CONSTRAINT [FK_Hardware_ApplicationInstanceId] FOREIGN KEY([ApplicationInstanceId]) REFERENCES [dbo].[ApplicationInstance] ([ApplicationInstanceID]) ON DELETE CASCADE
);