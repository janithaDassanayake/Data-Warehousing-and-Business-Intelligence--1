CREATE PROCEDURE dbo.UpdateCommodity_Catagory
@CommodityCategoryID int,
@CommodityCategoryName nvarchar(50)
AS
  BEGIN
     IF NOT EXISTS (
	               SELECT ProductCategoryID
	               FROM dbo.DimCommodity_Catagory
			       WHERE AlternateProductCategoryID = @CommodityCategoryID
				   AND
				   Name = @CommodityCategoryName
					)
     BEGIN 
      INSERT INTO dbo.DimCommodity_Catagory(AlternateProductCategoryID,Name)
	         VALUES(@CommodityCategoryID,@CommodityCategoryName)
     END;
END;