/*
CREATE TABLE PurchaseItem (
      PurchaseID smallint identity, 
      Supplier varchar(50),
      PurchaseType varchar(20), 
      PurchaseAmt money, 
      PurchaseDate date);
INSERT INTO PurchaseItem VALUES
    ('McLendon''s','Hardware',2121.09,'2014-01-12'),
      ('Bond','Electrical',12347.87,'2014-01-18'),
      ('Craftsman','Hardware',999.99,'2014-01-22'),
      ('Stanley','Hardware',6532.09,'2014-01-31'),
      ('RubberMaid','Kitchenware',3421.10,'2014-02-03'),
      ('RubberMaid','KitchenWare',1290.90,'2014-02-07'),
      ('Glidden','Paint',12987.01,'2014-02-10'),
      ('Dunn''s','Lumber',43235.67,'2014-02-21'),
      ('Maytag','Appliances',89320.19,'2014-03-10'),
      ('Amana','Appliances',53821.19,'2014-03-12'),
      ('Lumber Surplus','Lumber',3245.59,'2014-03-14'),
      ('Global Source','Outdoor',3331.59,'2014-03-19'),
      ('Scott''s','Garden',2321.01,'2014-03-21'),
      ('Platt','Electrical',3456.01,'2014-04-03'),
      ('Platt','Electrical',1253.87,'2014-04-21'),
      ('RubberMaid','Kitchenware',3332.89,'2014-04-20'),
      ('Cresent','Lighting',345.11,'2014-04-22'),
      ('Snap-on','Hardware',2347.09,'2014-05-03'),
      ('Dunn''s','Lumber',1243.78,'2014-05-08'),
      ('Maytag','Appliances',89876.90,'2014-05-10'),
      ('Parker','Paint',1231.22,'2014-05-10'),
      ('Scotts''s','Garden',3246.98,'2014-05-12'),
      ('Jasper','Outdoor',2325.98,'2014-05-14'),
      ('Global Source','Outdoor',8786.99,'2014-05-21'),
      ('Craftsman','Hardware',12341.09,'2014-05-22');
	  */

/* ROLLUP Examples*/
SELECT coalesce (PurchaseType,'GrandTotal') AS PurchaseType
     , Sum(PurchaseAmt) as SummorizedPurchaseAmt
FROM PurchaseItem
GROUP BY ROLLUP(PurchaseType);
GO
SELECT month(PurchaseDate) PurchaseMonth
     , CASE WHEN month(PurchaseDate) is null then 'Grand Total' 
                   ELSE coalesce (PurchaseType,'Monthly Total') end AS PurchaseType
     , Sum(PurchaseAmt) as SummorizedPurchaseAmt
FROM PurchaseItem
GROUP BY ROLLUP(month(PurchaseDate), PurchaseType);
GO
/* CUBE Example: Grand Total for Appliances*/
SELECT month(PurchaseDate) PurchaseMonth
     , CASE WHEN month(PurchaseDate) is null 
                  THEN coalesce ('Grand Total for ' + PurchaseType,'Grand Total')  
                ELSE coalesce (PurchaseType,'Monthly SubTotal') end AS PurchaseType
     , Sum(PurchaseAmt) as SummorizedPurchaseAmt
FROM PurchaseItem
GROUP BY CUBE(month(PurchaseDate), PurchaseType);
GO
/* GROUPING SETS Example*/
SELECT month(PurchaseDate) PurchaseMonth
     , PurchaseType AS PurchaseType
     , Sum(PurchaseAmt) as SummorizedPurchaseAmt
FROM PurchaseItem
GROUP BY GROUPING SETS (month(PurchaseDate), PurchaseType);
GO
SELECT NULL as PurchaseMonth
     , PurchaseType
     , Sum(PurchaseAmt) as SummorizedPurchaseAmt
FROM PurchaseItem
GROUP BY PurchaseType
UNION ALL
SELECT month(PurchaseDate) AS PurchaseMonth
     , NULL as PurchaseType
     , Sum(PurchaseAmt) as SummorizedPurchaseAmt
FROM PurchaseItem
GROUP BY month(PurchaseDate)