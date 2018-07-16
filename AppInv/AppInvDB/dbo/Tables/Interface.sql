/****** Interface *******/
CREATE TABLE [dbo].[Interface](
	[InterfaceID] [int] IDENTITY(1,1) NOT NULL,
	[ApplicationInstanceId] [int] NULL,
	[Deleted] [bit] CONSTRAINT [DF_Interface_Deleted] DEFAULT (0) NOT NULL,
	[CreatedBy] [nvarchar](30) NOT NULL,
	[ModifiedBy] [nvarchar](30) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[InterfaceName] [nvarchar](50) NULL,
	[InterfaceMWName] [nvarchar](50) NULL,
	[Direction] [nvarchar](50) NULL, /* Incoming, Outgoing, Both */
	[SourceInstanceId] [int] NULL,
	[DestinationInstanceId] [int] NULL,
	[AltSourceInstanceName] [nvarchar](50) NULL,
	[AltSourceDestinationName] [nvarchar](50) NULL,
	[Internal] [bit] NULL,
	[Multi] [bit] NULL,
	[Contact] [nvarchar](50) NULL,
	[Status] [nvarchar](50) NULL,
	[Comment] [nvarchar](2500) NULL,
    CONSTRAINT [PK_Interface] PRIMARY KEY CLUSTERED ([InterfaceID] ASC),
    CONSTRAINT [FK_Interface_ApplicationInstanceId] FOREIGN KEY([ApplicationInstanceId]) REFERENCES [dbo].[ApplicationInstance] ([ApplicationInstanceID]) ON DELETE CASCADE
	);

