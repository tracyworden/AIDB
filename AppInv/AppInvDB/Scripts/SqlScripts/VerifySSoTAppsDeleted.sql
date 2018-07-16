--drop table ##DeletedApps;
--create table ##DeletedApps (applicationid nvarchar(50));
--select * from ##DeletedApps;

select count(*) from application2 where
--lifecycle <> 'Retired' and 
 applicationid in (select * from ##DeletedApps)

select count(*) from ##DeletedApps

select count(*) from application2 where
--lifecycle <> 'Retired' and 
 applicationid in (select * from ##DeletedApps)

 select count(*) from application2 where
lifecycle <> 'Retired' and 
 applicationid in (select * from ##DeletedApps)
  
select * from application2 where
lifecycle <> 'Retired' and 
 applicationid in (select * from ##DeletedApps)

select *
from ##DeletedApps da
left join Applicationheader a on da.applicationid = a.applicationid 
where a.applicationid is null
