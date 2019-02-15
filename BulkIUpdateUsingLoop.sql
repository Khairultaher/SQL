
DECLARE @MaxRowNumber BIGINT = 0
DECLARE @LenCount BIGINT = 0
DECLARE @LoopCounter BIGINT = 1
DECLARE @LoopCountUntil BIGINT = 0
DECLARE @Start BIGINT = 0
DECLARE @End BIGINT = 0
DECLARE @Range BIGINT = 0
SELECT  @MaxRowNumber= MAX(Id) FROM  TransactionHistory_Test3 --WHERE Id <= 10000000
SELECT  @LenCount = len(@MaxRowNumber)

IF(@LenCount <= 3)
	BEGIN
		SET @Range = 500
		SELECT @End = @Range - 1
--		SELECT @LoopCountUntil = CEILING((CAST(@MaxRowNumber as FLOAT)/CAST(@Range as FLOAT)))
		SELECT @LoopCountUntil = (@MaxRowNumber/@Range)+1
	END
IF(@LenCount = 4)
	BEGIN
		SET @Range = 1000
		SELECT @End = @Range - 1
		SELECT @LoopCountUntil = (@MaxRowNumber/@Range)+1
	END
IF(@LenCount = 5)
	BEGIN
		SET @Range = 5000
		SELECT @End = @Range - 1
		SELECT @LoopCountUntil = (@MaxRowNumber/@Range)+1
	END
ELSE IF(@LenCount =6 )
	BEGIN
		SET @Range = 10000
		SELECT @End = @Range - 1
		SELECT @LoopCountUntil = (@MaxRowNumber/@Range)+1
	END
ELSE IF(@LenCount = 7)
	BEGIN
		SELECT  @Range = 50000
		SELECT @End = @Range - 1
		SELECT @LoopCountUntil = (@MaxRowNumber/@Range)+1
	END
ELSE IF(@LenCount = 8)
	BEGIN
		SELECT  @Range = 100000
		SELECT @End = @Range - 1
		SELECT @LoopCountUntil = (@MaxRowNumber/@Range)+1
	END
ELSE IF(@LenCount = 9)
	BEGIN
		SELECT  @Range = 500000
		SELECT @End = @Range - 1
		SELECT @LoopCountUntil = (@MaxRowNumber/@Range)+1
	END
ELSE IF(@LenCount >= 10)
	BEGIN
		SELECT  @Range = 1000000
		SELECT @End = @Range - 1
		SELECT @LoopCountUntil = (@MaxRowNumber/@Range)+1
	END

PRINT('Total Row - '+ CAST(@MaxRowNumber as VARCHAR))
PRINT('Total Loop - '+ CAST(@LoopCountUntil as VARCHAR))
PRINT('Range - '+ CAST(@Range as VARCHAR))
PRINT('-----------------------------')

WHILE  @LoopCounter <= @LoopCountUntil
BEGIN

	PRINT('Loop No - '+ CAST(@LoopCounter as VARCHAR))
	PRINT('Start With- '+CAST(@Start as VARCHAR))
	PRINT('End With- '+CAST(@End as VARCHAR))

--	SELECT    Id,t1.TransactionID, t1.ProductID, t1.ReferenceOrderID, t1.ReferenceOrderLineID, t1.TransactionDate, t1.TransactionType, t1.Quantity, t1.ActualCost, t1.ModifiedDate
     UPDATE t1
     SET   [ProductID] = t2.[ProductID]
      ,[ReferenceOrderID] = t2.[ReferenceOrderID]
      ,[ReferenceOrderLineID] = t2.[ReferenceOrderLineID]
      ,[TransactionDate] = t2.[TransactionDate]
      ,[TransactionType] = t2.[TransactionType]
      ,[Quantity] = t2.[Quantity]
      ,[ActualCost] = t2.[ActualCost]
      ,[ModifiedDate] = t2.[ModifiedDate]
	FROM  TransactionHistory_Test3 t1
	INNER  JOIN TransactionHistory_Test2 t2 ON t1.TransactionID  = t2.TransactionID
	WHERE (t1.Id >= @Start AND t1.Id <= @End);

	SET @LoopCounter += 1
	SET @Start  = @Start + @Range
	SET @End    = CASE WHEN (@LoopCounter = @LoopCountUntil) THEN  @MaxRowNumber ELSE (@End + @Range) END
END