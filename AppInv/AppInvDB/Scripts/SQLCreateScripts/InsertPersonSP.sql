/****** Object:  StoredProcedure [dbo].[InsertNewPerson]    Script Date: 5/16/2018 2:24:07 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE OR ALTER PROCEDURE  [dbo].[InsertNewPerson]
	@pName nvarchar(100),
	@pDesc nvarchar(250),
	@pEmail nvarchar(200),
	@pBusinessUser bit,
	@pOutStatus nvarchar(100) output

AS
BEGIN
	DECLARE
	  @userRole nvarchar(50),
	  @ErrorCode int

  BEGIN TRAN	
	--Verify data is provided
	--@@pName 
	IF (@pName IS NULL or @pName = '')
	  BEGIN
		set @pOutStatus = 'The Name was not provided: ' 
		GOTO CON_HANDLER 
      END

	IF (@pEmail IS NULL or @pEmail = '')
	  BEGIN
		set @pOutStatus = 'The Email was not provided: ' 
		GOTO CON_HANDLER 
      END

	--@pBusinessUser
	IF (@pBusinessUser IS NULL or @pBusinessUser = 0)
	  BEGIN
		set @userRole = 'IT Owner'
      END
    ELSE 
	  BEGIN
		set @userRole = 'Business Owner'
      END	
	  	
	select @pName
    select @pDesc
    select @pEmail
    select @userRole

    INSERT INTO [dbo].[Person]
           ([Deleted]
           ,[CreatedBy]
           ,[ModifiedBy]
           ,[CreatedDate]
           ,[ModifiedDate]
           ,[Name]
           ,[Description]
           ,[EmailAddress]
           ,[role])
     VALUES
           (0 --Deleted
	       ,'wordentr' --CreatedBy
	       ,'wordentr' --ModifedBy
	       ,GETDATE() --CreatedDate
	       ,GETDATE() -- ModifedDate
           ,@pName
           ,@pDesc
           ,@pEmail
           ,@userRole)

	set @pOutStatus = 'Person Loaded key ' 

CON_HANDLER:
      BEGIN
	   COMMIT TRAN
	  END
END
GO


