/****** Attachment ******/
CREATE TABLE [dbo].[Attachment](
	[AttachmentID] [int] IDENTITY(1,1) NOT NULL,
	[Deleted] [bit] CONSTRAINT [DF_Attachment_Deleted] DEFAULT (0) NOT NULL,
	[CreatedBy] [nvarchar](30) NOT NULL,
	[ModifiedBy] [nvarchar](30) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[Comment] [nvarchar](150) NULL,
	[LinkTable] [nvarchar](40) NULL,
	[LinkKey] [int] NULL,
	[AttachmentDetails] [nvarchar](max) NULL,
	[Attachment] [varbinary](max) NOT NULL,
 CONSTRAINT [PK_Attachment] PRIMARY KEY CLUSTERED ([AttachmentID] ASC)
);
