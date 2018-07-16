--drop table ##ActiveNames;
--create table ##ActiveNames (applicationname nvarchar(150));
--select * from ##ActiveNames;

select count(*) from application2 where
--lifecycle <> 'Retired' and 
 applicationname in (select * from ##ActiveNames)

select count(*) from ##ActiveNames

select count(*) from application2 where
applicationname in (select * from ##ActiveNames)

 select count(*) from application2 where
 applicationname in (select * from ##ActiveNames)
  
select * from application2 where
 applicationname in (select * from ##ActiveNames)

select *
from ##ActiveNames da
left join Applicationheader a on da.applicationname = a.applicationname 
where a.applicationname is null

