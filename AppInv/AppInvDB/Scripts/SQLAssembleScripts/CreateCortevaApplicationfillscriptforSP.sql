select 'declare @out nvarchar(max)' 

select CONCAT(
'exec InsertNewApplication ''',cast(applicationid as nvarchar(50)),''','
,'''',applicationname,''','
,'''',isnull(applicationtype,'Application'),''','
,'''',ApplicationDescription,''','
,'''',ITOwnerName,''','
,'''',BusinessOwnerName,''','
,'''',Organization,''','
,'''',Category,''','
,'''',status,''','
,'''',Lifecycle,''','
,'''',LifecycleComment,''','
,'''',Recommendation,''','
,'''',RecommendationComments,''','
,'''',DISOClassification,''','
,'''',PII,''','
,'''',servicedByExternalOrg,''','
,~sendtosom
,', @out OUTPUT', CHAR(13), CHAR(10), 'print @out'
)
from application2 where applicationheaderid in ( 3480,3887,5815,5828)

--select 'print @out'

select 'select top 200 * from application2 order by applicationheaderid desc'

