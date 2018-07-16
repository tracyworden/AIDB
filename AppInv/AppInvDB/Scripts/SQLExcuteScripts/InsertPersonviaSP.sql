declare @out nvarchar(max)

exec InsertNewPerson
	'Guillermo Itzik' --@pName
	,'LIDER DE MANTENIMIENTO LA-AR-Berazategui' --@pDescription 
	,'guillermo.itzik@dupont.com' --@pEmail
	,1 --@pAre they a business owner?
	,@out OUTPUT

print @out

exec InsertNewPerson
	'Marcus Batista' --@pName
	,'Mechanical Engineering Consultant LA-BR-Alphaville phone: 55-71-99964-5460' --@pDescription 
	,'marcus.batista@dupont.com' --@pEmail
	,0 --@pAre they a business owner?
	,@out OUTPUT

print @out

exec InsertNewPerson
	'Dave Schuster' --@pName
	,'Client Services Manager NA-US-IA-JOHNSTON-REID phone: 1(515)535-6842' --@pDescription 
	,'Dave.Schuster@pioneer.com' --@pEmail
	,0 --@pAre they a business owner?
	,@out OUTPUT

print @out
select top 5 * from person order by personid desc

