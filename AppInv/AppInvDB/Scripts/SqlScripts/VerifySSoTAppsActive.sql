--drop table ##ActiveApps;
--create table ##ActiveApps (applicationid nvarchar(150));
--select * from ##ActiveApps;

select count(*) as allapps from ##ActiveApps

select count(*) as aidbapps from application2 where
applicationid in (select * from ##ActiveApps)

 select count(*) as retiredapps from application2 where
lifecycle = 'Retired' and 
 applicationid in (select * from ##ActiveApps)
  
select * from application2 where
lifecycle = 'Retired' and 
 applicationid in (select * from ##ActiveApps)

select *
from ##ActiveApps da
left join Applicationheader a on da.applicationid = a.applicationid 
where a.applicationid is null
