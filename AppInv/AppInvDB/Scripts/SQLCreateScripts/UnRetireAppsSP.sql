/****** Object:  StoredProcedure [dbo].[RetireApps]    Script Date: 5/16/2018 2:24:07 PM ******/
--CREATE TYPE [dbo].[AppIdType] AS TABLE(
--	[appId] [nvarchar](50) NULL
--)
--GO


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE OR ALTER PROCEDURE  [dbo].[ReinstateApps]
	@AppIdType dbo.AppIdType ReadOnly,
	@pLifecycle nvarchar(250),
	@pComment nvarchar(250),
	@pOutStatus nvarchar(100) output

AS
BEGIN
	DECLARE
	  @AppKeys nvarchar(max),
	  @ErrorCode int,
	  @Lifecycleid int


  BEGIN TRAN	
	--Verify data is provided
	--@@pName 
	IF NOT EXISTS (SELECT * FROM @AppIdType)
	  BEGIN
		set @pOutStatus = 'No applications provided: ' 
		GOTO CON_HANDLER 
      END

	IF (@pLifecycle IS NULL or @pLifecycle = '')
	  BEGIN
		set @pLifecycle = 'Production - Standard'
      END

	--GetLifecycle
	select @LifecycleId = lifecycleid from lifecycle where lifecycle = @pLifecycle;
	IF (@LifecycleId IS NULL)
	  BEGIN
	    set @pOutStatus = 'The Lifecycle provided was not found in category table'
		GOTO CON_HANDLER 
	  END

	CREATE TABLE #AppKeys (
	 appKey int
    );
	
	insert into #AppKeys select applicationheaderid from applicationheader where applicationid IN (SELECT * FROM @AppIdType);

	SELECT * FROM @AppIdType
	SELECT * FROM #AppKeys
    select @pComment

    update lifecyclestatus set lifecycleid = @LifecycleId, modifieddate = getDate(), comment = @pComment
    where applicationheaderid in (SELECT * FROM #AppKeys)

	update applicationheader set statusid = 1, modifiedDate = GetDate(), RecommendationComments = RecommendationComments + ' ' + @pComment
    where applicationheaderid in (SELECT * FROM #AppKeys)

	set @pOutStatus = 'Apps Reinstated ' 

CON_HANDLER:
      BEGIN
	   COMMIT TRAN
	  END
END
GO





