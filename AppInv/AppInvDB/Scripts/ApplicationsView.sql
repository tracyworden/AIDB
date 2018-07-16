/*SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[Applications] AS 
	SELECT 
	 ah.applicationheaderid,
     ApplicationId,
	 ApplicationName, 
	 cat.Category,
	 ApplicationDescription,
	 ApplicationType,
	 lc.Lifecycle,
	 stat.status,
	 ITOwn.Name ITOwnerName,
	 ITOwn.EmailAddress ITOwneremailAddress,
	 BOwn.Name BusinessOwnerName,
	 BOwn.EmailAddress BusinessOwneremailAddress,
	 Organization,
	 RecommendationComments,
	 servicedByExternalOrg
FROM [ApplicationHeader] ah
LEFT OUTER JOIN  [Category] cat ON ah.CategoryId = cat.CategoryID
LEFT OUTER JOIN [LifecycleStatus] lif ON ah.ApplicationHeaderID = Lif.ApplicationheaderId
LEFT OUTER JOIN  [Person] Itown ON ah.ITOwnerId = ITown.PersonId
LEFT OUTER JOIN  [Person] Bown ON ah.BusinessOwnerId = Bown.PersonId
LEFT OUTER JOIN [Lifecycle] lc ON Lif.LifecycleId = Lc.LifecycleID
LEFT OUTER JOIN [Status] stat ON ah.statusid = stat.statusid
where ah.deleted = 0 
and cat.deleted = 0
and itown.deleted = 0
and lif.deleted = 0
and lc.deleted = 0
GO*/


