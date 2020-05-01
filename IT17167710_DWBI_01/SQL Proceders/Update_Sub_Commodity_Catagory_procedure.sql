CREATE PROCEDURE dbo.Update_Sub_Commodity_Catagory
@Sub_CommodityCategoryID int,
@Sub_CommodityCategoryName nvarchar(50),
@CommodityCategoryID int
AS
  BEGIN
     IF NOT EXISTS (
	               SELECT ProductSubcategoryID
	               FROM dbo.DimSub_Commodity_Catagory
			       WHERE AlternateProductSubCategoryID = @Sub_CommodityCategoryID
				   AND
				   name = @Sub_CommodityCategoryName
				   AND
				   ProductCategoryID=@CommodityCategoryID
					)
     BEGIN 
      INSERT INTO  dbo.DimSub_Commodity_Catagory(AlternateProductSubCategoryID,name,ProductCategoryID)
	         VALUES(@Sub_CommodityCategoryID,@Sub_CommodityCategoryName,@CommodityCategoryID)
     END;
END;


