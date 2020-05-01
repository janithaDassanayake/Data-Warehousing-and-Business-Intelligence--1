

----=========================================Data COUNT IN Source , Staging & Dimension=========================================----------


-- ----------------------------------------------- ConsumerDetails  -------------------------------------------------------


                               -- Dim ConsumerDetails  count-- 

USE [IT17167710_DataWareHouse]
GO
select count(*) as Dim_Consumer_Count
from dbo.DimConsumerDetails

                               -- Staging ConsumerDetails count-- 

USE [IT17167710_DataStaging]
GO
select count(*) as Consumer_Staging_Count
from dbo.ConsumerDetails_Staging

                                 -- source ConsumerDetails count-- 

USE [IT17167710_DataSource]
GO
select count(*) as Consumer_Source_Count
from dbo.ConsumerDetails

 


-- ----------------------------------------------- sales Region Representative  -------------------------------------------------------



                   -- Dim sales Region Representative -- 

USE [IT17167710_DataWareHouse]
GO
select count(*) as Dim_Representive_Count
from dbo.Dim_RegionSalesRepresentive

                               -- Staging sales Region Representative -- 

USE [IT17167710_DataStaging]
GO
select count(*) as Staging_Representive_Count
from dbo.salesRegionRepresentative_Staging

                                -- Scource sales Region Representative -- 

USE [IT17167710_DataSource2]
GO
select count(*) as Source_Representive_Count
from dbo.salesRegionRepresentative





-- -----------------------------------------------  OrderDetail  -------------------------------------------------------

                -- Fact Sales -- 

USE [IT17167710_DataWareHouse]
GO
select count(OrderID) as Fact_Table_OrderCount
from dbo.SalesFact

            -- Staging OrderDetail-- 

USE [IT17167710_DataStaging]
GO
select count(Order_ID) as Staging_OrderCount
from dbo.OrderDetail_staging

             -- Source OrderDetail -- 

USE [IT17167710_DataSource]
GO
select count(Order_ID) as Source_OrderCount
from dbo.OrderDetail


-- -----------------------------------------------  Commodity  -------------------------------------------------------
  
    -- Fact Sales -- 
USE [IT17167710_DataWareHouse]
GO
select count( Distinct ProductID) as Fact_Table_Commodity_Count
from dbo.SalesFact

 -- Dim Commodity -- 

USE [IT17167710_DataWareHouse]
GO
select count(ProductID) as Dim_Commodity_Count
from dbo.DimCommodity

   -- Staging Commodity -- 

USE [IT17167710_DataStaging]
GO
select count(Product_ID) as Staging_Commodity_Count
from dbo.Commodity_staging

     -- Source Commodity --
	 
USE [IT17167710_DataSource]
GO
select count(Product_ID) as Source_Commodity_Count
from dbo.Commodity




-- -----------------------------------------------   Sub_Commodity_Catagory  -------------------------------------------------------

              -- Dim Sub_Commodity_Catagory -- 

USE [IT17167710_DataWareHouse]
GO
select count(*) as 
Dim_Sub_Commodity_Catagorye_Count
from dbo.DimSub_Commodity_Catagory

            -- Staging Sub_Commodity_Catagory -- 

USE [IT17167710_DataStaging]
GO
select count(*) as Staging_Sub_Commodity_Catagory_Count
from dbo.Sub_Commodity_Catagory_staging

              -- Scource Sub_Commodity_Catagory -- 

USE [IT17167710_DataSource]
GO
select count(*) as Source_Sub_Commodity_Catagory_Count
from dbo.Sub_Commodity_Catagory

							




							
				---------------------------------- meta Data Testing (Data type testing)-------------------------------- -- 

							 -- source ConsumerDetails -- 
							
USE [IT17167710_DataSource]
GO
select COLUMN_NAME, DATA_TYPE, CHARACTER_MAXIMUM_LENGTH, NUMERIC_PRECISION, DATETIME_PRECISION, IS_NULLABLE 
from INFORMATION_SCHEMA.COLUMNS 
where TABLE_NAME='ConsumerDetails' 

									 -- Staging ConsumerDetails -- 

USE [IT17167710_DataStaging]
GO
select COLUMN_NAME, DATA_TYPE, CHARACTER_MAXIMUM_LENGTH, NUMERIC_PRECISION, DATETIME_PRECISION, IS_NULLABLE 
from INFORMATION_SCHEMA.COLUMNS 
where TABLE_NAME='ConsumerDetails_staging' 

									 -- Dim ConsumerDetails -- 
USE [IT17167710_DataWareHouse]
GO
select COLUMN_NAME, DATA_TYPE, CHARACTER_MAXIMUM_LENGTH, NUMERIC_PRECISION, DATETIME_PRECISION, IS_NULLABLE 
from INFORMATION_SCHEMA.COLUMNS 
where TABLE_NAME='DimConsumerDetails'







					
		---------------------------------- meta Data Testing (Data type testing)-------------------------------- -- 

							 -- source Commodity -- 
							
USE [IT17167710_DataSource]
GO
select COLUMN_NAME, DATA_TYPE, CHARACTER_MAXIMUM_LENGTH, NUMERIC_PRECISION, DATETIME_PRECISION, IS_NULLABLE 
from INFORMATION_SCHEMA.COLUMNS 
where TABLE_NAME='Commodity'
									 -- Staging Commodity -- 

USE [IT17167710_DataStaging]
GO
select COLUMN_NAME, DATA_TYPE, CHARACTER_MAXIMUM_LENGTH, NUMERIC_PRECISION, DATETIME_PRECISION, IS_NULLABLE 
from INFORMATION_SCHEMA.COLUMNS 
where TABLE_NAME='Commodity_staging' 

									 -- Dim Commodity -- 
USE [IT17167710_DataWareHouse]
GO
select COLUMN_NAME, DATA_TYPE, CHARACTER_MAXIMUM_LENGTH, NUMERIC_PRECISION, DATETIME_PRECISION, IS_NULLABLE 
from INFORMATION_SCHEMA.COLUMNS 
where TABLE_NAME='DimCommodity' 

				
		---------------------------------- meta Data Testing (Data type testing)-------------------------------- -- 

							 -- source sales Region Representative -- 
							
USE [IT17167710_DataSource2]
GO
select COLUMN_NAME, DATA_TYPE, CHARACTER_MAXIMUM_LENGTH, NUMERIC_PRECISION, DATETIME_PRECISION, IS_NULLABLE 
from INFORMATION_SCHEMA.COLUMNS 
where TABLE_NAME='salesRegionRepresentative'
									 -- Staging sales Region Representative -- 

USE [IT17167710_DataStaging]
GO
select COLUMN_NAME, DATA_TYPE, CHARACTER_MAXIMUM_LENGTH, NUMERIC_PRECISION, DATETIME_PRECISION, IS_NULLABLE 
from INFORMATION_SCHEMA.COLUMNS 
where TABLE_NAME='salesRegionRepresentative_Staging' 

									 -- Dim sales Region Representative -- 
USE [IT17167710_DataWareHouse]
GO
select COLUMN_NAME, DATA_TYPE, CHARACTER_MAXIMUM_LENGTH, NUMERIC_PRECISION, DATETIME_PRECISION, IS_NULLABLE 
from INFORMATION_SCHEMA.COLUMNS 
where TABLE_NAME='Dim_RegionSalesRepresentive' 







			--=========================================  Data Length Check Testing =========================================----


			---------------------------------------consumer 1 Random Data Length ------------------------------------------


					          ---Dim Consumer Details ---
USE [IT17167710_DataWareHouse]
GO
SELECT DATALENGTH(c.FirstName) as Fname_length ,DATALENGTH(c.LastName) as  Lname_length ,DATALENGTH(c.Segment) as  Segment_length
From DimConsumerDetails c
where c.FirstName='Alex' AND c.LastName='Avila';
                            
							
							 ---Dim  Consumer  Details ---
USE [IT17167710_DataStaging]
GO
SELECT DATALENGTH(c.First_Name) as Fname_length ,DATALENGTH(c.Last_Name) as  Lname_length ,DATALENGTH(c.Segment) as  Segment_length
From ConsumerDetails_staging c
where c.First_Name='Alex' AND c.Last_Name='Avila';
 
						   ---Source Consumer Details ---

USE [IT17167710_DataSource]
GO
SELECT DATALENGTH(c.First_Name) as Fname_length ,DATALENGTH(c.Last_Name) as  Lname_length ,DATALENGTH(c.Segment) as  Segment_length
From ConsumerDetails c
where c.First_Name='Alex' AND c.Last_Name='Avila';




		 ---------------------------------------consumer 2 Random Data Length ------------------------------------------



					          ---Dim Consumer Details ---
USE [IT17167710_DataWareHouse]
GO
SELECT DATALENGTH(c.FirstName) as Fname_length ,DATALENGTH(c.LastName) as  Lname_length ,DATALENGTH(c.Segment) as  Segment_length
From DimConsumerDetails c
where c.FirstName='Adrian' AND c.LastName='Barton';
      		
							 ---Dim  Consumer  Details ---
USE [IT17167710_DataStaging]
GO
SELECT DATALENGTH(c.First_Name) as Fname_length ,DATALENGTH(c.Last_Name) as  Lname_length ,DATALENGTH(c.Segment) as  Segment_length
From ConsumerDetails_staging c
where c.First_Name='Adrian' AND c.Last_Name='Barton';
 
						   ---Source Consumer Details ---

USE [IT17167710_DataSource]
GO
SELECT DATALENGTH(c.First_Name) as Fname_length ,DATALENGTH(c.Last_Name) as  Lname_length ,DATALENGTH(c.Segment) as  Segment_length
From ConsumerDetails c
where c.First_Name='Adrian' AND c.Last_Name='Barton';



				 ---------------------------------------Commodity 1 Random Data Length ------------------------------------------

					       ---Dim Commodity  data length ---
USE [IT17167710_DataWareHouse]
GO
SELECT DATALENGTH(c.Product_Name) as Product_Name_length ,DATALENGTH(c.ProductNumber) as  ProductNumber_length ,DATALENGTH(c.ProductSubCategoryID) as ProductSubCategoryID_length
From DimCommodity c
where c.ProductNumber='FUR-BO-10000112' ;
                            
							
							 ---staging Commodity  data length ---
USE [IT17167710_DataStaging]
GO
SELECT DATALENGTH(c.Product_Name) as Product_Name_length ,DATALENGTH(c.ProductNumber) as  ProductNumber_length ,DATALENGTH(c.ProductSubCategoryID) as ProductSubCategoryID_length
From Commodity_staging c
where c.ProductNumber='FUR-BO-10000112' ;
						   ---Source Commodity Details ---

USE [IT17167710_DataSource]
GO
SELECT DATALENGTH(c.Product_Name) as Product_Name_length ,DATALENGTH(c.ProductNumber) as  ProductNumber_length ,DATALENGTH(c.ProductSubCategoryID) as ProductSubCategoryID_length
From Commodity c
where c.ProductNumber='FUR-BO-10000112' ;


					 ---------------------------------------Commodity 2 Random Data Length ------------------------------------------


					       ---Dim Commodity  data length ---
	
USE [IT17167710_DataWareHouse]
GO
SELECT DATALENGTH(c.Product_Name) as Product_Name_length ,DATALENGTH(c.ProductNumber) as  ProductNumber_length ,DATALENGTH(c.ProductSubCategoryID) as ProductSubCategoryID_length
From DimCommodity c
where c.ProductNumber='FUR-BO-10000330' ;
                            			
							 ---staging Commodity  data length ---
USE [IT17167710_DataStaging]
GO
SELECT DATALENGTH(c.Product_Name) as Product_Name_length ,DATALENGTH(c.ProductNumber) as  ProductNumber_length ,DATALENGTH(c.ProductSubCategoryID) as ProductSubCategoryID_length
From Commodity_staging c
where c.ProductNumber='FUR-BO-10000330' ;

						   ---Source Commodity Details ---

USE [IT17167710_DataSource]
GO
SELECT DATALENGTH(c.Product_Name) as Product_Name_length ,DATALENGTH(c.ProductNumber) as  ProductNumber_length ,DATALENGTH(c.ProductSubCategoryID) as ProductSubCategoryID_length
From Commodity c
where c.ProductNumber='FUR-BO-10000330' ;




              ---------------------------------------Commodity Catagory Data Length ------------------------------------------
			

					          ---Dim Commodity_Catagory Data Length---
USE [IT17167710_DataWareHouse]
GO
SELECT DATALENGTH(c.Name) as CommodityName_length ,DATALENGTH(c.ProductCategoryID) as  CommodityID_length
From DimCommodity_Catagory c
where c.ProductCategoryID=2;
                            
							---Dim Commodity_Catagory Data Length---
USE [IT17167710_DataStaging]
GO
SELECT DATALENGTH(c.Category) as CommodityName_length ,DATALENGTH(c.ProductCatagoryID) as  CommodityID_length
From Commodity_Catagory_staging c
where c.ProductCatagoryID=2;
 
						   ---Source Commodity_Catagory Data Length ---

USE [IT17167710_DataSource]
GO
SELECT DATALENGTH(c.Category) as CommodityName_length ,DATALENGTH(c.ProductCatagoryID) as  CommodityID_length
From Commodity_Catagory c
where c.ProductCatagoryID=2;




              ---------------------------------------Commodity Catagory Data Length ------------------------------------------
			

					          ---Dim Commodity_Catagory Data Length---
USE [IT17167710_DataWareHouse]
GO
SELECT DATALENGTH(c.Name) as CommodityName_length ,DATALENGTH(c.ProductCategoryID) as  CommodityID_length
From DimCommodity_Catagory c
where c.ProductCategoryID=1;
                            
							---Dim Commodity_Catagory Data Length---
USE [IT17167710_DataStaging]
GO
SELECT DATALENGTH(c.Category) as CommodityName_length ,DATALENGTH(c.ProductCatagoryID) as  CommodityID_length
From Commodity_Catagory_staging c
where c.ProductCatagoryID=1;
 
						   ---Source Commodity_Catagory Data Length ---

USE [IT17167710_DataSource]
GO
SELECT DATALENGTH(c.Category) as CommodityName_length ,DATALENGTH(c.ProductCatagoryID) as  CommodityID_length
From Commodity_Catagory c
where c.ProductCatagoryID=1;







			--=========================================  Data Duplication Check Testing in Source , Staging And DWH =========================================----


			  ---------------------------------------Data Duplication in Consumer ------------------------------------------

	---------------Dim Consumer Details------------

USE[IT17167710_DataWareHouse]
GO
select count (*) as Duplicate_values_In_Dimension
from DimConsumerDetails c
group by  c.CustomerID
having count (*)>1
		
	---------------Consumer Details Staging----------

USE[IT17167710_DataStaging]
GO
select count (*) as Duplicate_values_IN_Staging 
from ConsumerDetails_staging c
group by  c.Customer_ID
having count (*)>1
				
			---------------Consumer Details Source-----

USE[IT17167710_DataSource]
GO
select count (*) as Duplicate_values_IN_Source 
from ConsumerDetails c
group by  c.Customer_ID
having count (*)>1


	






				---------------------------------------Data Commodity in Consumer ------------------------------------------

		---------------Dim Commodity Details------------
USE[IT17167710_DataWareHouse]
GO
select count (*) as Duplicate_values_In_Commodity_Dimension
from DimCommodity c
group by  c.ProductID
having count (*)>1
							---------------Commodity Staging------------

USE[IT17167710_DataStaging]
GO
select count (*) as Duplicate_values_IN_Commodity_Staging 
from Commodity_staging c
group by  c.Product_ID
having count (*)>1
					
							---------------Commodity Source------------
USE[IT17167710_DataSource]
GO
select count (*) as Duplicate_values_IN_Commodity_Source 
from Commodity c
group by  c.Product_ID
having count (*)>1
					
					
				

					---------------------------------------Data Commodity Catagory in Consumer ------------------------------------------


							---------------Dim  Commodity Catagory------------
USE[IT17167710_DataWareHouse]
GO
select count (*) as Duplicate_values_In_Commodity_Catagory_Dimension
from DimCommodity_Catagory c
group by  c.ProductCategoryID
having count (*)>1
							--------------- Commodity Catagory Staging------------

USE[IT17167710_DataStaging]
GO
select count (*) as Duplicate_values_IN_Commodity_Catagory_Staging 
from Commodity_Catagory_staging c
group by  c.ProductCatagoryID
having count (*)>1
					
							--------------- Commodity Catagory Source------------
USE[IT17167710_DataSource]
GO
select count (*) as Duplicate_values_IN_Commodity_Catagory_Source 
from Commodity_Catagory c
group by  c.ProductCatagoryID
having count (*)>1
				
				

	


					---------------------------------------Data Commodity Sub Catagory in Consumer ------------------------------------------

		---------------Dim sub Commodity Catagory ------------

USE[IT17167710_DataWareHouse]
GO
select count (*) as Duplicate_values_In_DimSub_Commodity_Catagory
from DimSub_Commodity_Catagory c
group by  c.ProductSubcategoryID
having count (*)>1
	---------------Commodity Sub CatagoryStaging------------

USE[IT17167710_DataStaging]
GO
select count (*) as Duplicate_values_IN_Sub_Commodity_Catagory_Staging 
from Sub_Commodity_Catagory_staging c
group by  c.ProductSubCategoryID
having count (*)>1
					
	---------------Commodity Sub Catagory Source------------
USE[IT17167710_DataSource]
GO
select count (*) as Duplicate_values_IN_Sub_Commodity_Catagory_Source 
from Sub_Commodity_Catagory c
group by  c.ProductSubCategoryID
having count (*)>1
	
	


					---------------------------------------Data Commodity Sub Catagory in Consumer ------------------------------------------

		---------------Dim_RegionSalesRepresentive Details------------
USE[IT17167710_DataWareHouse]
GO
select count (*) as Duplicate_values_In_Dim_RegionSalesRepresentive
from Dim_RegionSalesRepresentive c
group by  c.RegionID
having count (*)>1
		
		---------------RegionSalesRepresentive Staging------------

USE[IT17167710_DataStaging]
GO
select count (*) as Duplicate_values_IN_RegionSalesRepresentive_Staging 
from salesRegionRepresentative_Staging c
group by  c.RegionID
having count (*)>1
					
		---------------RegionSalesRepresentive Source------------
USE[IT17167710_DataSource2]
GO
select count (*) as Duplicate_values_IN_RegionSalesRepresentive_Source 
from  salesRegionRepresentative c
group by  c.RegionID
having count (*)>1




--==================================================ConstraintsCheck ==============================================--


									----------- constraints SalesFact---------

USE[IT17167710_DataWareHouse]
GO
SELECT    a.table_name,
			 a.constraint_name,
				 b.column_name,
					  a.constraint_type
FROM      information_schema.table_constraints a,
          information_schema.key_column_usage b
WHERE			a.table_name = 'SalesFact'
				AND	 a.table_name = b.table_name
					AND  a.table_schema = b.table_schema
						AND  a.constraint_name = b.constraint_name;

						
								----------- constraints Dim_RegionSalesRepresentive---------

USE[IT17167710_DataWareHouse]
GO
SELECT    a.table_name,
			 a.constraint_name,
				 b.column_name,
					  a.constraint_type
FROM      information_schema.table_constraints a,
          information_schema.key_column_usage b
WHERE			a.table_name = 'Dim_RegionSalesRepresentive'
				AND	 a.table_name = b.table_name
					AND  a.table_schema = b.table_schema
						AND  a.constraint_name = b.constraint_name;

									----------- constraints Dim_RegionSalesRepresentive---------

USE[IT17167710_DataWareHouse]
GO
SELECT    a.table_name,
			 a.constraint_name,
				 b.column_name,
					  a.constraint_type
FROM      information_schema.table_constraints a,
          information_schema.key_column_usage b
WHERE			a.table_name = 'DimCommodity'
				AND	 a.table_name = b.table_name
					AND  a.table_schema = b.table_schema
						AND  a.constraint_name = b.constraint_name;


								----------- constraints DimCommodity_Catagory---------

USE[IT17167710_DataWareHouse]
GO
SELECT    a.table_name,
			 a.constraint_name,
				 b.column_name,
					  a.constraint_type
FROM      information_schema.table_constraints a,
          information_schema.key_column_usage b
WHERE			a.table_name = 'DimCommodity_Catagory'
				AND	 a.table_name = b.table_name
					AND  a.table_schema = b.table_schema
						AND  a.constraint_name = b.constraint_name;


						         ----------- constraints DimSub_Commodity_Catagory---------

USE[IT17167710_DataWareHouse]
GO
SELECT    a.table_name,
			 a.constraint_name,
				 b.column_name,
					  a.constraint_type
FROM      information_schema.table_constraints a,
          information_schema.key_column_usage b
WHERE			a.table_name = 'DimSub_Commodity_Catagory'
				AND	 a.table_name = b.table_name
					AND  a.table_schema = b.table_schema
						AND  a.constraint_name = b.constraint_name;



						
----========================================= Check Whether Slowly Changing Dimensions Work as Expected =========================================----------


------------------------------------- Dim Consumer Details Slowly Changing Dimensions -------------------------------

USE [IT17167710_DataWareHouse]
GO
select * 
from dbo.DimConsumerDetails c


USE [IT17167710_DataWareHouse]
GO
UPDATE dbo.DimConsumerDetails
SET City= 'Los Angeles',State='California',Region='West'
WHERE CustomerID=1;


USE [IT17167710_DataWareHouse]
GO
select * 
from dbo.DimConsumerDetails c
where c.FirstName='Alex' AND c.LastName='Avila';




------------------------------------- Dim Commodity Slowly Changing Dimensions -------------------------------

USE [IT17167710_DataWareHouse]
GO
select * 
from dbo.DimCommodity


USE [IT17167710_DataWareHouse]
GO
UPDATE dbo.Dim_RegionSalesRepresentive
SET person= 'Dark Bookcase'
WHERE RegionID=1;


USE [IT17167710_DataWareHouse]
GO
select * 
from dbo.DimCommodity c
where c.ProductNumber='FUR-BO-10000112'

