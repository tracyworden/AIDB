--Person
--SET IDENTITY_INSERT Person ON
select 'INSERT INTO Person (PersonId,Deleted,CreatedBy,ModifiedBy,CreatedDate,ModifiedDate,Name,Description,EmailAddress,role) VALUES ('
+ cast(PersonId as varchar(20)) + ','
+ cast(Deleted as varchar(20)) + ','
+''''+CreatedBy+''','''
+ModifiedBy+''','
+ 'convert(datetime,'''+convert(varchar,createddate,121)+''',121),'
+ 'convert(datetime,'''+convert(varchar,ModifiedDate,121)+''',121),'
+''''+Name+''','''
+Description+''','''
+EmailAddress+''','''
+role+''')'
from person
--SET IDENTITY_INSERT Person OFF

--Applicationheader
select 'insert into ApplicationHeader values(' 
+ cast(Deleted as varchar(20)) + ','
+''''+CreatedBy+''','''
+ModifiedBy+''','
+ 'convert(datetime,'''+convert(varchar,createddate,121)+''',121),'
+ 'convert(datetime,'''+convert(varchar,ModifiedDate,121)+''',121),'
+''''+ApplicationId+''','                
+''''+ApplicationName+''','                
+''''+isnull(ApplicationType,'Application')+''','                
+ cast(ApplicationCost as varchar(20)) + ','           
+''''+ApplicationDescription+''','
+ cast(ITOwnerID as varchar(20)) + ','         
+ cast(BusinessOwnerID as varchar(20)) + ','          
 +''''+Organization+''','      
+ cast(CategoryID as varchar(20)) + ','      
+ cast(StatusID as varchar(20)) + ','   
+''''+Recommendation+''','     
+ 'convert(datetime,'''+convert(varchar,RecommendationDate,121)+''',121),'
+''''+RecommendationComments+''','     
+ cast(DISOClassificationID as varchar(20)) + ','         
+ cast(PII as varchar(20)) + ','         
+''''+BusinessProcessArea+''','        
+ cast(BusinessCriticalityID as varchar(20)) + ','    
+''''+servicedByExternalOrg+''','   
 + cast(SendToSom as varchar(20)) + ')'      
from ApplicationHeader where applicationheaderid in 
(3552,
3729,
3866,
3876,
3905,
3931,
3993,
4113,
4133,
4139,
4315,
4318,
4396,
5121)





select 'insert into lifecyclestatus values(' 
+ cast(applicationheaderid as varchar(20))  + ','
+ cast(Lifecycleid as varchar(20))  + ','
+ cast(Deleted as varchar(20)) + ','
+''''+CreatedBy+''','''
+ModifiedBy+''','
+ 'convert(datetime,'''+convert(varchar,createddate,121)+''',121),'
+ 'convert(datetime,'''+convert(varchar,ModifiedDate,121)+''',121),'
+ 'convert(datetime,'''+convert(varchar,date,121)+''',121),'
+''''+Comment+''');'  
from lifecyclestatus where applicationheaderid in 
(3552,
3729,
3866,
3876,
3905,
3931,
3993,
4113,
4133,
4139,
4315,
4318,
4396,
5121)