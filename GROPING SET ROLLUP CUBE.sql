SELECT YEAR(TransactionDate) [Year], 
       CASE WHEN (GROUPING_ID(YEAR(TransactionDate)) = 0 AND  GROUPING_ID(MONTH(TransactionDate)) <> 0)  THEN 'SubTotal' 
	        WHEN (GROUPING_ID(YEAR(TransactionDate)) <> 0 AND  GROUPING_ID(MONTH(TransactionDate)) <> 0)  THEN 'Total' 
	        ELSE CAST(MONTH(TransactionDate) as NVARCHAR(2))  END [Month],
	   COUNT(Id) [Count]
FROM Transactions
GROUP BY ROLLUP (YEAR(TransactionDate),MONTH(TransactionDate))
GO

SELECT Id,TransactionNo,AccountId,Amount,
SUM(Amount) OVER(PARTITION BY AccountId order by AccountId, TransactionNo ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) CumilitiveSum
FROM Transactions
ORDER BY AccountId,TransactionNo
