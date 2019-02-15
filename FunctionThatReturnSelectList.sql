IF OBJECT_ID(N'dbo.ifGetTotalItems', N'IF') IS NOT NULL
DROP FUNCTION dbo.ifGetTotalItems;
GO
CREATE FUNCTION dbo.ifGetTotalItems (@OrderID INT)
RETURNS TABLE
WITH SCHEMABINDING
AS
RETURN
(
  SELECT SUM(OrderQty) AS TotalItems
  FROM Sales.SalesOrderDetail
  WHERE SalesOrderID = @OrderID
  GROUP BY SalesOrderID
);