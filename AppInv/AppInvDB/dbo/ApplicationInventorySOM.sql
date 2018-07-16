/* View for SOM */
CREATE VIEW [dbo].[ApplicationInventorySOM]
	AS SELECT 
	 ApplicationName name, 
	 cat.Category CategoryName,
	 ApplicationDescription,
	 lc.Lifecycle deploymentDisposition,
	 ITOwn.Name ITOwnerName,
	 ITOwn.EmailAddress ITOwneremailAddress,
	 Organization OwningOrganizationName,
	 RecommendationComments,
	 ApplicationID assetID,
	 servicedByExternalOrg
FROM [ApplicationHeader] ah
LEFT OUTER JOIN  [Category] cat ON ah.CategoryID = cat.CategoryID
LEFT OUTER JOIN [LifecycleStatus] lif ON ah.ApplicationHeaderID = Lif.ApplicationHeaderID
LEFT OUTER JOIN  [Person] Itown ON ah.ITOwnerID = ITown.PersonID
LEFT OUTER JOIN [Lifecycle] lc ON Lif.LifecycleID = Lc.LifecycleID
where ah.Deleted = 0 
and cat.Deleted = 0
and itown.Deleted = 0
and lif.Deleted = 0
and lc.Deleted = 0
AND ah.SendToSom = 1;

