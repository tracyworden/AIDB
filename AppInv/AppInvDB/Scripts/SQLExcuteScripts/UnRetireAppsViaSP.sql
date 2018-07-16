declare @out nvarchar(max)
declare @apps nvarchar(max)

Declare @AppIdType dbo.AppIdType

Insert into @AppIdType VALUES
('CR117'),
('EF62BAFD-4F6B-4B6B-9ECF-6A8EB8A7367A')

exec ReinstateApps 
	@AppIdType
	,'Production - Non-Standard'
	,'Retired via SSoT request but many SOM tickets reinstating July 10, 2018' --@pComment nvarchar(250),
	,@out OUTPUT

print @out

select * from application2 where applicationid in (SELECT * FROM @AppIdType);
