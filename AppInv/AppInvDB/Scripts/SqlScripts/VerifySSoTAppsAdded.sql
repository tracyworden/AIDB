create table #AddedApps (applicationid nvarchar(50));
insert into #AddedApps values ('CR0476');


select count(*) from applicationheader where
 --lifecycle <> 'Retired' and 
 applicationid in (select * from #AddedApps)

 select count(*) from #AddedApps



SELECT a.applicationid
FROM applicationheader a
LEFT outer JOIN #AddedApps b
ON a.applicationid = b.applicationid
 WHERE a.applicationid IS NULL 

 select a.applicationid
 from #AddedApps a
where not exists (select applicationid
from applicationheader)


select *
from #AddedApps da
left join Applicationheader a on da.applicationid = a.applicationid 
where a.applicationid is null