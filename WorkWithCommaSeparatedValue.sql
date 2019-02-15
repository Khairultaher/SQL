/* Single row value to Comma Separated Value*/
SELECT STUFF((substring(( Select ','+ CONVERT(varchar(10), tx.Id) as [text()] 
					                             FROM Transactions tx
												 INNER JOIN AccountInformations ac ON tx.AccountId = ac.Id
												 WHERE    ac.Id = st.AccountId 
												      AND tx.TransactionDate = st.TransactionDate
													  AND tx.TransactionType = st.TransactionType
													  AND tx.TransactionMedia =st.TransactionMedia
									           For XML PATH ('')), 2, 1000)),1,0,'')

/* Comma Separated value to row value*/
	 ;WITH SingleTxn
	 AS(
	 SELECT CustomerId,TxnDate,TxnMedia,TxnType,ScoredLabel,ScoredProbability,
		LTRIM(RTRIM(m.n.value('.[1]','varchar(8000)'))) AS TxnId
		FROM
		(
		SELECT CustomerId,TxnDate,TxnMedia,TxnType,ScoredLabel,ScoredProbability,CAST('<XMLRoot><RowData>' + REPLACE(Txns,',','</RowData><RowData>') + '</RowData></XMLRoot>' AS XML) AS x
		FROM   #StructuringData
		)t
		CROSS APPLY x.nodes('/XMLRoot/RowData')m(n)
	 )
	 SELECT * INTO #SingleTxn 
	 FROM SingleTxn