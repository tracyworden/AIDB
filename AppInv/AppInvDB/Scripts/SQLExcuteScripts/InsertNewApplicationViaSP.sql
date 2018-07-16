declare @out nvarchar(max)
exec InsertNewApplication 
	'TX0028' --@pAppId
	,'MOBI Wireless ' --@pAppName 
	,'Tool' --@pAppType
	,'Cloud-based software that centralizes and automates management of mobile devices by integrating with wireless carriers, MDMs, and corporate IT systems.' --@pappDesc
	,'Matt Cubit' --@pITOwner
	,'Tony Lewis' --@pBusOwner 
	,'DuPont' --@pOrg
	,'Mobility' --@pCategory
	,null --@pStatus
	,null --@pLifecycle
	,'Added to inventory per Matt Cubit email dated May 23' --@pLifecycleComment
	,'Sustain' --@pRecommendation nvarchar(100),
	,'Added to inventory per Matt Cubit email dated May 23'  --@pRecComment
	,'DISO-PUBLIC' -- @pDISOClass
	,null --@pPII
	,null --@pServiceVendor 
	,null --@pSendToSom
	,@out OUTPUT

print @out

select * from application2 order by applicationheaderid desc

