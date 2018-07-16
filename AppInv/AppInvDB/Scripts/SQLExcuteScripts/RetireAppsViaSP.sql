declare @out nvarchar(max)
declare @apps nvarchar(max)

Declare @AppIdType dbo.AppIdType

Insert into @AppIdType VALUES
('10782'),
('10784'),
('10788'),
('10789'),
('10790'),
('10792'),
('10801'),
('10802')

exec RetireApps 
	@AppIdType
	,'Retired Hospitality applicaitons per email E. Ronald Walters SSoT July 5, 2018' --@pComment nvarchar(250),
	,@out OUTPUT

print @out

select * from application2 where applicationid in (SELECT * FROM @AppIdType);

