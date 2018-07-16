/*declare @out nvarchar(max)
exec InsertNewApplication 
	'TX0025' --@pAppId
	,'SharePoint - DuPont SecureVault' --@pAppName 
	,'Application' --@pAppType
	,'Decision Center Analytics' --@pappDesc
	,'Wendy Beatty' --@pITOwner
	,'Seema Singh' --@pBusOwner 
	,'DuPont' --@pOrg
	,'Unified Communications & Collaboration' --@pCategory
	,null --@pStatus
	,null --@pLifecycle
	,'Added to inventory per SharePoint List April 26,2018' --@pLifecycleComment
	,'Sustain' --@pRecommendation nvarchar(100),
	,'Added to inventory per SharePoint List April 26,2018'  --@pRecComment
	,null -- @pDISOClass
	,null --@pPII
	,null --@pServiceVendor 
	,null --@pSendToSom
	,@out OUTPUT

print @out*/

select top 5 * from application2 order by applicationheaderid desc

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER PROCEDURE [dbo].[InsertNewApplication]
	@pAppId nvarchar(50),
	@pAppName nvarchar(150),
	@pAppType nvarchar(20),
	@pappDesc nvarchar(max),
	@pITOwner nvarchar(150),
	@pBusOwner nvarchar(150),
	@pOrg nvarchar(100),
	@pCategory nvarchar(100),
	@pStatus nvarchar(100),
	@pLifecycle nvarchar(100),
	@pLifeComment nvarchar(100),
	@pRecommendation nvarchar(100),
	@pRecComment nvarchar(max),
	@pDISOClass nvarchar(100),
	@pPII bit,
	@pServiceVendor nvarchar(100),
	@pSendToSom bit,
	@pOutStatus nvarchar(100) output

AS
BEGIN
	DECLARE
	  @ITOwner int,
	  @BusOwner int,
	  @Category int,
	  @Status int,
	  @Lifecycle int,
	  @DISOClass int,
	  @ErrorCode int,
	  @HDRId int	

  BEGIN TRAN	
	--Verify data is provided
	--@pAppId 
	IF (@pAppId IS NULL or @pAppId = '')
	  BEGIN
		set @pOutStatus = 'The Applicaiton ID was not provided: ' 
		GOTO CON_HANDLER 
      END

	IF (@pAppName IS NULL or @pAppName = '')
	  BEGIN
		set @pOutStatus = 'The Application Name was not provided: ' 
		GOTO CON_HANDLER 
      END

	--@pAppType
	IF (@pAppType IS NULL or @pAppType = '')
	  BEGIN
		set @pAppType = 'Application' 
      END

	--ITOwner
	IF (@pITOwner IS NULL or @pITOwner = '')
	  BEGIN
		set @pOutStatus = 'The IT Owner was not provided: ' + @pITOwner
		GOTO CON_HANDLER 
      END
	--BusinessOwner
	IF (@pBusOwner IS NULL or @pBusOwner = '')
	  BEGIN
		set @pOutStatus = 'The Business Owner was not provided' + @pBusOwner
		GOTO CON_HANDLER 
      END
	--Category
	IF (@pCategory IS NULL or @pCategory = '')
	  BEGIN
		set @pOutStatus = 'The Category was not provided' 
		GOTO CON_HANDLER 
      END
	--Status
	IF (@pStatus IS NULL or @pStatus = '')
	  BEGIN
		set @pStatus = 'Active'
      END
	--Lifecycle
	IF (@pLifecycle IS NULL or @pLifecycle = '')
	  BEGIN
		set @pLifecycle = 'Production - Standard'
      END
	--DISOClassification
	IF (@pDISOClass IS NULL or @pDISOClass = '')
	  BEGIN
		set @pDISOClass = 'DISO-INTERNAL USE ONLY'
      END

	--PII
	IF (@pPII IS NULL)
	  BEGIN
		set @pPII = 0
      END

    --SendToSom
	IF (@pSendToSom IS NULL)
	  BEGIN
		set @pSendToSom = 1
      END

	--select @pAppId
	--select @pAppName
	--select @pAppType
	--select @pappDesc
	--select @pITOwner
	--select @pBusOwner
	--select @pCategory
	--select @pStatus
	--select @pLifecycle
	select @pDISOClass
	--select @pPII
	--select @pServiceVendor
	--select @pSendToSom

	--GetITOwner
	select @ITOwner = PersonId from Person where name like '%' + @pITOwner + '%';
	IF (@ITOwner IS NULL)
	  BEGIN
	    set @pOutStatus = 'The IT Owner provided was not found in person table'
		GOTO CON_HANDLER 
	  END

	--GetBusinessOwner
	select @BusOwner = PersonId from Person where name = @pBusOwner;
	IF (@BusOwner IS NULL)
	  BEGIN
	    set @pOutStatus = 'The Business Owner provided was not found in person table'
		GOTO CON_HANDLER 
	  END

	--GetCategory
	select @Category = categoryid from category where category = @pCategory;
	IF (@Category IS NULL)
	  BEGIN
	    set @pOutStatus = 'The Category provided was not found in category table'
		GOTO CON_HANDLER 
	  END

	--GetStatus
	select @Status = statusid from status where status = @pStatus;
	IF (@Status IS NULL)
	  BEGIN
	    set @pOutStatus = 'The Status ' + @pStatus +' provided was not found in status table'
		GOTO CON_HANDLER 
	  END

	--GetLifecycle
	select @Lifecycle = lifecycleid from lifecycle where lifecycle = @pLifecycle;
	IF (@Lifecycle IS NULL)
	  BEGIN
	    set @pOutStatus = 'The Lifecycle provided was not found in category table'
		GOTO CON_HANDLER 
	  END

	--GetDisoClassification
	select @DISOClass = DISOClassificationID from DISOClassification where DISOClassification = @pDISOClass;
	IF (@DISOClass IS NULL)
	  BEGIN
	    set @pOutStatus = 'The DISOClassification provided was not found in category table'
		GOTO CON_HANDLER 
	  END
 
      INSERT INTO [dbo].[ApplicationHeader]
           ([Deleted]
           ,[CreatedBy]
           ,[ModifiedBy]
           ,[CreatedDate]
           ,[ModifiedDate]
           ,[ApplicationId]
           ,[ApplicationName]
           ,[ApplicationType]
           ,[ApplicationCost]
           ,[ApplicationDescription]
           ,[ITOwnerID]
           ,[BusinessOwnerID]
           ,[Organization]
           ,[CategoryID]
           ,[StatusID]
           ,[Recommendation]
           ,[RecommendationDate]
           ,[RecommendationComments]
           ,[DISOClassificationID]
           ,[PII]
           ,[BusinessProcessArea]
           ,[BusinessCriticalityID]
           ,[servicedByExternalOrg]
		   ,[SendToSom])
	     VALUES (0 --Deleted
	       ,'wordentr' --CreatedBy
	       ,'wordentr' --ModifedBy
	       ,GETDATE() --CreatedDate
	       ,GETDATE() -- ModifedDate
	       ,@pAppId --ApplicationId
	       ,@pAppName --ApplicationName
	       ,@pAppType --ApplicationType (Application,Tool,Interface,Process)
	       ,0 --ApplicatonCost
	       ,@pappDesc --Description
	       ,@ITOwner --IT Owner
	       ,@BusOwner -- Business Owner 
	       ,@pOrg -- Organization
	       ,@Category --Category
	       ,@Status -- Status
	       ,@pRecommendation --Recommendation
	       ,GetDate() --RecommendationDate
	       ,@pRecComment --RecommendationComments
	       ,@DISOClass --DisoClassification
	       ,@pPII --Pii
	       ,'' --BusinessProcessArea
	       ,8 --BusinessCriticalityId
	       ,@pServiceVendor--Servicedbyexternalorg
		   ,@pSendToSom); --Send to SOM?

	Set @pOutStatus = 'Application Header Inserted'
	set @HdrId = IDENT_CURRENT('ApplicationHeader')
	select @HdrId

    INSERT INTO [dbo].[LifecycleStatus]
           ([ApplicationHeaderID]
           ,[LifecycleID]
           ,[Deleted]
           ,[CreatedBy]
           ,[ModifiedBy]
           ,[CreatedDate]
           ,[ModifiedDate]
           ,[Date]
           ,[Comment])
     VALUES
        (@HdrId -- <ApplicationHeaderID, int,>
        ,@Lifecycle --<LifecycleID, int,>
        ,0 --Deleted
		,'wordentr' --CreatedBy
		,'wordentr' --ModifedBy
		,GETDATE() --CreatedDate
		,GETDATE() -- ModifedDate
        ,GETDATE()  --,<Date, datetime,>
        ,@pLifeComment); --<Comment, nvarchar(250),>

	Set @pOutStatus = 'Application Succesfully Loaded'

CON_HANDLER:
      BEGIN
	   COMMIT TRAN
	  END
END