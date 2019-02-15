
/* Index on CustomerInformations table */
-- Id,FirstName,MiddleName,LastName,ScrCustomerType,PresentCountry,PresentCity,BranchId,ScreeningDate,LastUpdateDate,CustomerStatus,ScreeningStatus,EntryType 

IF NOT EXISTS (SELECT 1 FROM sys.indexes I  WHERE I.Name = 'NCIX_CustomerInformations_FirstName' AND I.object_id = OBJECT_ID('dbo.CustomerInformations'))
	CREATE NONCLUSTERED  INDEX NCIX_CustomerInformations_FirstName On CustomerInformations(FirstName Asc)
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes I  WHERE I.Name = 'NCIX_CustomerInformations_MiddleName' AND I.object_id = OBJECT_ID('dbo.CustomerInformations'))
	CREATE NONCLUSTERED  INDEX NCIX_CustomerInformations_MiddleName On CustomerInformations (MiddleName Asc)
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes I  WHERE I.Name = 'NCIX_CustomerInformations_LastName' AND I.object_id = OBJECT_ID('dbo.CustomerInformations'))
	CREATE NONCLUSTERED  INDEX NCIX_CustomerInformations_LastName On CustomerInformations(LastName Asc)
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes I  WHERE I.Name = 'NCIX_CustomerInformations_ScrCustomerType' AND I.object_id = OBJECT_ID('dbo.CustomerInformations'))
	CREATE NONCLUSTERED  INDEX NCIX_CustomerInformations_ScrCustomerType On CustomerInformations(ScrCustomerType Asc)
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes I  WHERE I.Name = 'NCIX_CustomerInformations_PresentCountry' AND I.object_id = OBJECT_ID('dbo.CustomerInformations'))
	CREATE NONCLUSTERED  INDEX NCIX_CustomerInformations_PresentCountry On CustomerInformations(PresentCountry Asc)
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes I  WHERE I.Name = 'NCIX_CustomerInformations_PresentCity' AND I.object_id = OBJECT_ID('dbo.CustomerInformations'))
	CREATE NonClustered INDEX NCIX_CustomerInformations_PresentCity On CustomerInformations(PresentCity Asc)
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes I  WHERE I.Name = 'NCIX_CustomerInformations_BranchId' AND I.object_id = OBJECT_ID('dbo.CustomerInformations'))
	CREATE NONCLUSTERED  INDEX NCIX_CustomerInformations_BranchId On CustomerInformations(BranchId Asc)
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes I  WHERE I.Name = 'NCIX_CustomerInformations_ScreeningDate' AND I.object_id = OBJECT_ID('dbo.CustomerInformations'))
	CREATE NONCLUSTERED  INDEX NCIX_CustomerInformations_ScreeningDate On CustomerInformations(ScreeningDate Asc)
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes I  WHERE I.Name = 'NCIX_CustomerInformations_LastReviewDate' AND I.object_id = OBJECT_ID('dbo.CustomerInformations'))
	CREATE NONCLUSTERED  INDEX NCIX_CustomerInformations_LastReviewDate On CustomerInformations(LastReviewDate Asc)
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes I  WHERE I.Name = 'NCIX_CustomerInformations_CustUniqTrackNo' AND I.object_id = OBJECT_ID('dbo.CustomerInformations'))
	CREATE NONCLUSTERED  INDEX NCIX_CustomerInformations_CustUniqTrackNo On CustomerInformations(CustUniqTrackNo Asc)
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes I  WHERE I.Name = 'NCIX_CustomerInformations_EntryDate' AND I.object_id = OBJECT_ID('dbo.CustomerInformations'))
	CREATE NONCLUSTERED  INDEX NCIX_CustomerInformations_EntryDate On CustomerInformations(EntryDate Asc)
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes I  WHERE I.Name = 'NCIX_CustomerInformations_RiskLevel' AND I.object_id = OBJECT_ID('dbo.CustomerInformations'))
	CREATE NONCLUSTERED  INDEX NCIX_CustomerInformations_RiskLevel On CustomerInformations(RiskLevel Asc)
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes I  WHERE I.Name = 'NCIX_CustomerInformations_CustomerNo' AND I.object_id = OBJECT_ID('dbo.CustomerInformations'))
	CREATE NONCLUSTERED  INDEX NCIX_CustomerInformations_CustomerNo On CustomerInformations(CustomerNo Asc)
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes I  WHERE I.Name = 'NCIX_CustomerInformations_LastUpdateDate' AND I.object_id = OBJECT_ID('dbo.CustomerInformations'))
	CREATE NONCLUSTERED  INDEX NCIX_CustomerInformations_LastUpdateDate On CustomerInformations(LastUpdateDate Asc)
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes I  WHERE I.Name = 'NCIX_CustomerInformations_CustomerStatus' AND I.object_id = OBJECT_ID('dbo.CustomerInformations'))
	CREATE NONCLUSTERED  INDEX NCIX_CustomerInformations_CustomerStatus On CustomerInformations(CustomerStatus Asc)
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes I  WHERE I.Name = 'NCIX_CustomerInformations_ScreeningStatus' AND I.object_id = OBJECT_ID('dbo.CustomerInformations'))
	CREATE NONCLUSTERED  INDEX NCIX_CustomerInformations_ScreeningStatus On CustomerInformations(ScreeningStatus Asc)
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes I  WHERE I.Name = 'NCIX_CustomerInformations_EntryType' AND I.object_id = OBJECT_ID('dbo.CustomerInformations'))
	CREATE NONCLUSTERED  INDEX NCIX_CustomerInformations_EntryType On CustomerInformations(EntryType Asc)
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes I  WHERE I.Name = 'NCIX_CustomerInformations_CustomerType' AND I.object_id = OBJECT_ID('dbo.CustomerInformations'))
	CREATE NONCLUSTERED INDEX [NCIX_CustomerInformations_CustomerType] ON [dbo].[CustomerInformations]([CustomerType] ASC)
	INCLUDE ([Id],[CustomerNo],[CustUniqTrackNo],[FirstName],[MiddleName],[LastName],[PresentCountry],[RiskScore],[RiskLevel],[CustomerStatus],[ScreeningStatus],[KycRiskStatus],[AccountStatus]) 
	WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
GO
/* RelatedPartyInformations */
-- Id,FirstName,MiddleName,LastName,PresentCountry,PresentCity,ScreeningDate ASC
IF NOT EXISTS (SELECT 1 FROM sys.indexes I  WHERE I.Name = 'NCIX_RelatedPartyInformations_FirstName' AND I.object_id = OBJECT_ID('dbo.RelatedPartyInformations'))
	CREATE NONCLUSTERED  INDEX NCIX_RelatedPartyInformations_FirstName  On RelatedPartyInformations(FirstName Asc)
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes I  WHERE I.Name = 'NCIX_RelatedPartyInformations_MiddleName' AND I.object_id = OBJECT_ID('dbo.RelatedPartyInformations'))
	CREATE NONCLUSTERED  INDEX NCIX_RelatedPartyInformations_MiddleName On RelatedPartyInformations(MiddleName Asc)
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes I  WHERE I.Name = 'NCIX_RelatedPartyInformations_LastName' AND I.object_id = OBJECT_ID('dbo.RelatedPartyInformations'))
	CREATE NONCLUSTERED  Index NCIX_RelatedPartyInformations_LastName On RelatedPartyInformations(LastName Asc)
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes I  WHERE I.Name = 'NCIX_RelatedPartyInformations_PresentCountry' AND I.object_id = OBJECT_ID('dbo.RelatedPartyInformations'))
	Create NONCLUSTERED  INDEX NCIX_RelatedPartyInformations_PresentCountry On RelatedPartyInformations(PresentCountry Asc)
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes I  WHERE I.Name = 'NCIX_RelatedPartyInformations_PresentCity' AND I.object_id = OBJECT_ID('dbo.RelatedPartyInformations'))
	CREATE NONCLUSTERED  INDEX NCIX_RelatedPartyInformations_PresentCity On RelatedPartyInformations(PresentCity Asc)
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes I  WHERE I.Name = 'NCIX_RelatedPartyInformations_ScreeningDate' AND I.object_id = OBJECT_ID('dbo.RelatedPartyInformations'))
	CREATE NONCLUSTERED  INDEX NCIX_RelatedPartyInformations_ScreeningDate On RelatedPartyInformations(ScreeningDate Asc)
GO
/* Index on RelatedPartyReviewHistory*/
-- ReviewDate,ReviewerBranchId,ReviewStatus,CurrentState
IF NOT EXISTS (SELECT 1 FROM sys.indexes I  WHERE I.Name = 'NCIX_RelatedPartyReviewHistory_ReviewDate' AND I.object_id = OBJECT_ID('dbo.RelatedPartyReviewHistory'))
	CREATE NONCLUSTERED  INDEX NCIX_RelatedPartyReviewHistory_ReviewDate On RelatedPartyReviewHistory(ReviewDate Asc)
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes I  WHERE I.Name = 'NCIX_RelatedPartyReviewHistory_ReviewerBranchId' AND I.object_id = OBJECT_ID('dbo.RelatedPartyReviewHistory'))
	CREATE NONCLUSTERED  INDEX NCIX_RelatedPartyReviewHistory_ReviewerBranchId On RelatedPartyReviewHistory(ReviewerBranchId Asc)
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes I  WHERE I.Name = 'NCIX_RelatedPartyReviewHistory_ReviewStatus' AND I.object_id = OBJECT_ID('dbo.RelatedPartyReviewHistory'))
	CREATE NONCLUSTERED  INDEX NCIX_RelatedPartyReviewHistory_ReviewStatus On RelatedPartyReviewHistory(ReviewStatus Asc)
GO
/*Index on AccountInformations table*/
-- BranchId,AccountNumber,ProductId,AccountType,AccOpeningDate,AccClosingDate,UpdateDate
IF NOT EXISTS (SELECT 1 FROM sys.indexes I WHERE I.Name = 'NCIX_AccountInformations_AccountNumber' AND I.object_id = OBJECT_ID('dbo.AccountInformations'))
	CREATE NONCLUSTERED INDEX NCIX_AccountInformations_AccountNumber ON AccountInformations (AccountNumber) --INCLUDE ()
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes I WHERE I.Name = 'NCIX_AccountInformations_BranchId' AND I.object_id = OBJECT_ID('dbo.AccountInformations'))
	CREATE NONCLUSTERED INDEX NCIX_AccountInformations_BranchId ON AccountInformations (BranchId) --INCLUDE ()
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes I WHERE I.Name = 'NCIX_AccountInformations_ProductId' AND I.object_id = OBJECT_ID('dbo.AccountInformations'))
	CREATE NONCLUSTERED INDEX NCIX_AccountInformations_ProductId ON AccountInformations (ProductId) --INCLUDE ()
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes I WHERE I.Name = 'NCIX_AccountInformations_AccountType' AND I.object_id = OBJECT_ID('dbo.AccountInformations'))
	CREATE NONCLUSTERED INDEX NCIX_AccountInformations_AccountType ON AccountInformations (AccountType) --INCLUDE ()
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes I WHERE I.Name = 'NCIX_AccountInformations_AccOpeningDate' AND I.object_id = OBJECT_ID('dbo.AccountInformations'))
	CREATE NONCLUSTERED INDEX NCIX_AccountInformations_AccOpeningDate ON AccountInformations (AccOpeningDate) --INCLUDE ()
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes I WHERE I.Name = 'NCIX_AccountInformations_AccClosingDate' AND I.object_id = OBJECT_ID('dbo.AccountInformations'))
	CREATE NONCLUSTERED INDEX NCIX_AccountInformations_AccClosingDate ON AccountInformations (AccClosingDate) --INCLUDE ()
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes I WHERE I.Name = 'NCIX_AccountInformations_UpdateDate' AND I.object_id = OBJECT_ID('dbo.AccountInformations'))
	CREATE NONCLUSTERED INDEX NCIX_AccountInformations_UpdateDate ON AccountInformations (UpdateDate) --INCLUDE ()
GO
/* Index on CustomerAccounts table */
IF NOT EXISTS (SELECT 1 FROM sys.indexes I WHERE I.Name = 'NCIX_CustomerAccounts_AccountId' AND I.object_id = OBJECT_ID('dbo.CustomerAccounts'))
	CREATE NONCLUSTERED INDEX NCIX_CustomerAccounts_AccountId ON CustomerAccounts (AccountId) INCLUDE (CustomerId)
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes I WHERE I.Name = 'NCIX_CustomerAccounts_CustomerId' AND I.object_id = OBJECT_ID('dbo.CustomerAccounts'))
	CREATE NONCLUSTERED INDEX NCIX_CustomerAccounts_CustomerId ON CustomerAccounts ( CustomerId) INCLUDE (AccountId)
GO
/*Index on StrFilings table*/
-- CreatedUserId,Status,AccountId,AccountNo,CurrentState,BranchId

IF NOT EXISTS (SELECT 1 FROM sys.indexes I WHERE I.Name = 'NCIX_StrFilings_CreatedUserId' AND I.object_id = OBJECT_ID('dbo.StrFilings'))
	CREATE NONCLUSTERED INDEX NCIX_StrFilings_CreatedUserId ON StrFilings ( CreatedUserId) --INCLUDE ()
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes I WHERE I.Name = 'NCIX_StrFilings_Status' AND I.object_id = OBJECT_ID('dbo.StrFilings'))
	CREATE NONCLUSTERED INDEX NCIX_StrFilings_Status ON StrFilings ( Status) --INCLUDE ()
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes I WHERE I.Name = 'NCIX_StrFilings_AccountId' AND I.object_id = OBJECT_ID('dbo.StrFilings'))
	CREATE NONCLUSTERED INDEX NCIX_StrFilings_AccountId ON StrFilings ( AccountId) --INCLUDE ()
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes I WHERE I.Name = 'NCIX_StrFilings_AccountNo' AND I.object_id = OBJECT_ID('dbo.StrFilings'))
	CREATE NONCLUSTERED INDEX NCIX_StrFilings_AccountNo ON StrFilings ( AccountNo) --INCLUDE ()
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes I WHERE I.Name = 'NCIX_StrFilings_CurrentState' AND I.object_id = OBJECT_ID('dbo.StrFilings'))
	CREATE NONCLUSTERED INDEX NCIX_StrFilings_CurrentState ON StrFilings ( CurrentState) --INCLUDE ()
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes I WHERE I.Name = 'NCIX_StrFilings_BranchId' AND I.object_id = OBJECT_ID('dbo.StrFilings'))
	CREATE NONCLUSTERED INDEX NCIX_StrFilings_BranchId ON StrFilings ( BranchId) --INCLUDE ()
GO

/* Index on StrTransactions table */
-- StrId,TransactionNo,AccountId,ViolatedRule
IF NOT EXISTS (SELECT 1 FROM sys.indexes I WHERE I.Name = 'NCIX_StrTransactions_AccountId' AND I.object_id = OBJECT_ID('dbo.StrTransactions'))
	CREATE NONCLUSTERED INDEX NCIX_StrTransactions_AccountId ON StrTransactions ( AccountId) --INCLUDE ()
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes I WHERE I.Name = 'NCIX_StrTransactions_StrId' AND I.object_id = OBJECT_ID('dbo.StrTransactions'))
	CREATE NONCLUSTERED INDEX NCIX_StrTransactions_StrId ON StrTransactions ( StrId) --INCLUDE ()
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes I WHERE I.Name = 'NCIX_StrTransactions_TransactionNo' AND I.object_id = OBJECT_ID('dbo.StrTransactions'))
	CREATE NONCLUSTERED INDEX NCIX_StrTransactions_TransactionNo ON StrTransactions ( TransactionNo) --INCLUDE ()
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes I WHERE I.Name = 'NCIX_StrTransactions_TransactionId' AND I.object_id = OBJECT_ID('dbo.StrTransactions'))
	CREATE NONCLUSTERED INDEX NCIX_StrTransactions_TransactionId ON StrTransactions ( TransactionId) --INCLUDE ()
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes I WHERE I.Name = 'NCIX_StrTransactions_ViolatedRule' AND I.object_id = OBJECT_ID('dbo.StrTransactions'))
	CREATE NONCLUSTERED INDEX NCIX_StrTransactions_ViolatedRule ON StrTransactions ( ViolatedRule) --INCLUDE ()
GO
/* Index on ReviewStatus table */
-- ValueField
IF NOT EXISTS (SELECT 1 FROM sys.indexes I WHERE I.Name = 'NCIX_ReviewStatus_ValueField' AND I.object_id = OBJECT_ID('dbo.ReviewStatus'))
	CREATE NONCLUSTERED INDEX NCIX_ReviewStatus_ValueField ON ReviewStatus ( ValueField) --INCLUDE ()
GO
/* Index on Rules table */
-- RuleCode,ThresholdAmount,MaxAlowedAmount,Period
IF NOT EXISTS (SELECT 1 FROM sys.indexes I WHERE I.Name = 'NCIX_Rules_RuleCode' AND I.object_id = OBJECT_ID('dbo.Rules'))
	CREATE NONCLUSTERED INDEX NCIX_Rules_RuleCode ON Rules (RuleCode) --INCLUDE ()
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes I WHERE I.Name = 'NCIX_Rules_ThresholdAmount' AND I.object_id = OBJECT_ID('dbo.Rules'))
	CREATE NONCLUSTERED INDEX NCIX_Rules_ThresholdAmount ON Rules (ThresholdAmount) --INCLUDE ()
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes I WHERE I.Name = 'NCIX_Rules_MaxAlowedAmount' AND I.object_id = OBJECT_ID('dbo.Rules'))
	CREATE NONCLUSTERED INDEX NCIX_Rules_MaxAlowedAmount ON Rules (MaxAlowedAmount) --INCLUDE ()
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes I WHERE I.Name = 'NCIX_Rules_Period' AND I.object_id = OBJECT_ID('dbo.Rules'))
	CREATE NONCLUSTERED INDEX NCIX_Rules_Period ON Rules (Period) --INCLUDE ()
GO
/* Index on Transactions Table */
-- TransactionNo,TransactionType,AccountId,AccountOrReferenceNo,TransactionMediaId,Amount,TransactionDate
IF NOT EXISTS (SELECT 1 FROM sys.indexes I WHERE I.Name = 'NCIX_Transactions_TransactionNo' AND I.object_id = OBJECT_ID('dbo.Transactions'))
	CREATE NONCLUSTERED INDEX NCIX_Transactions_TransactionNo ON Transactions (TransactionNo) --INCLUDE ()
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes I WHERE I.Name = 'NCIX_Transactions_TransactionType' AND I.object_id = OBJECT_ID('dbo.Transactions'))
	CREATE NONCLUSTERED INDEX NCIX_Transactions_TransactionType ON Transactions (TransactionType) --INCLUDE ()
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes I WHERE I.Name = 'NCIX_Transactions_AccountId' AND I.object_id = OBJECT_ID('dbo.Transactions'))
	CREATE NONCLUSTERED INDEX NCIX_Transactions_AccountId ON Transactions (AccountId) --INCLUDE ()
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes I WHERE I.Name = 'NCIX_Transactions_AccountOrReferenceNo' AND I.object_id = OBJECT_ID('dbo.Transactions'))
	CREATE NONCLUSTERED INDEX NCIX_Transactions_AccountOrReferenceNo ON Transactions (AccountOrReferenceNo) --INCLUDE ()
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes I WHERE I.Name = 'NCIX_Transactions_TransactionMediaId' AND I.object_id = OBJECT_ID('dbo.Transactions'))
	CREATE NONCLUSTERED INDEX NCIX_Transactions_TransactionMediaId ON Transactions (TransactionMediaId) --INCLUDE ()
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes I WHERE I.Name = 'NCIX_Transactions_Amount' AND I.object_id = OBJECT_ID('dbo.Transactions'))
	CREATE NONCLUSTERED INDEX NCIX_Transactions_Amount ON Transactions (Amount) --INCLUDE ()
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes I WHERE I.Name = 'NCIX_Transactions_TransactionDate' AND I.object_id = OBJECT_ID('dbo.Transactions'))
	CREATE NONCLUSTERED INDEX NCIX_Transactions_TransactionDate ON Transactions (TransactionDate) --INCLUDE ()
GO
/*Index on AMLScheduleScreening Table */
-- CaseID,CustomerID,SanctionListName,ScreeningDate,MatchID
IF NOT EXISTS (SELECT 1 FROM sys.indexes I WHERE I.Name = 'NCIX_AMLScheduleScreening_CaseID' AND I.object_id = OBJECT_ID('dbo.AMLScheduleScreening'))
	CREATE NONCLUSTERED INDEX NCIX_AMLScheduleScreening_CaseID ON AMLScheduleScreening (CaseID) --INCLUDE ()
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes I WHERE I.Name = 'NCIX_AMLScheduleScreening_CustomerID' AND I.object_id = OBJECT_ID('dbo.AMLScheduleScreening'))
	CREATE NONCLUSTERED INDEX NCIX_AMLScheduleScreening_CustomerID ON AMLScheduleScreening (CustomerID) --INCLUDE ()
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes I WHERE I.Name = 'NCIX_AMLScheduleScreening_SanctionListName' AND I.object_id = OBJECT_ID('dbo.AMLScheduleScreening'))
	CREATE NONCLUSTERED INDEX NCIX_AMLScheduleScreening_SanctionListName ON AMLScheduleScreening (SanctionListName) --INCLUDE ()
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes I WHERE I.Name = 'NCIX_AMLScheduleScreening_MatchID' AND I.object_id = OBJECT_ID('dbo.AMLScheduleScreening'))
	CREATE NONCLUSTERED INDEX NCIX_AMLScheduleScreening_MatchID ON AMLScheduleScreening (MatchID) --INCLUDE ()
GO
/* Index on AMLScheScrReviewResult table*/
-- ScheduleScreeningID,BranchID,ReviewerID,ReviewStatus,ReviewDate
IF NOT EXISTS (SELECT 1 FROM sys.indexes I WHERE I.Name = 'NCIX_AMLScheScrReviewResult_ScheduleScreeningID' AND I.object_id = OBJECT_ID('dbo.AMLScheScrReviewResult'))
	CREATE NONCLUSTERED INDEX NCIX_AMLScheScrReviewResult_ScheduleScreeningID ON AMLScheScrReviewResult (ScheduleScreeningID) --INCLUDE ()
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes I WHERE I.Name = 'NCIX_AMLScheScrReviewResult_BranchID' AND I.object_id = OBJECT_ID('dbo.AMLScheScrReviewResult'))
	CREATE NONCLUSTERED INDEX NCIX_AMLScheScrReviewResult_BranchID ON AMLScheScrReviewResult (BranchID) --INCLUDE ()
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes I WHERE I.Name = 'NCIX_AMLScheScrReviewResult_ReviewerID' AND I.object_id = OBJECT_ID('dbo.AMLScheScrReviewResult'))
	CREATE NONCLUSTERED INDEX NCIX_AMLScheScrReviewResult_ReviewerID ON AMLScheScrReviewResult (ReviewerID) --INCLUDE ()
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes I WHERE I.Name = 'NCIX_AMLScheScrReviewResult_ReviewDate' AND I.object_id = OBJECT_ID('dbo.AMLScheScrReviewResult'))
	CREATE NONCLUSTERED INDEX NCIX_AMLScheScrReviewResult_ReviewDate ON AMLScheScrReviewResult (ReviewDate) --INCLUDE ()
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes I WHERE I.Name = 'NCIX_AMLScheScrReviewResult_ActiveStatus' AND I.object_id = OBJECT_ID('dbo.AMLScheScrReviewResult'))
	CREATE NONCLUSTERED INDEX NCIX_AMLScheScrReviewResult_ActiveStatus ON AMLScheScrReviewResult (ActiveStatus) INCLUDE ( 	[Comments])  ON [PRIMARY]
GO
/*Index on AMLScheScrReviewResultHistory table*/
-- ScheduleScreeningID,ReviewerID,ReviewerBranchID,ReviewStatus,ReviewDate,ReviewLevel
IF NOT EXISTS (SELECT 1 FROM sys.indexes I WHERE I.Name = 'NCIX_AMLScheScrReviewResultHistory_ScheduleScreeningID' AND I.object_id = OBJECT_ID('dbo.AMLScheScrReviewResultHistory'))
	CREATE NONCLUSTERED INDEX NCIX_AMLScheScrReviewResultHistory_ScheduleScreeningID ON AMLScheScrReviewResultHistory (ScheduleScreeningID) --INCLUDE ()
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes I WHERE I.Name = 'NCIX_AMLScheScrReviewResultHistory_ReviewerID' AND I.object_id = OBJECT_ID('dbo.AMLScheScrReviewResultHistory'))
	CREATE NONCLUSTERED INDEX NCIX_AMLScheScrReviewResultHistory_ReviewerID ON AMLScheScrReviewResultHistory (ReviewerID) --INCLUDE ()
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes I WHERE I.Name = 'NCIX_AMLScheScrReviewResultHistory_ReviewerBranchID' AND I.object_id = OBJECT_ID('dbo.AMLScheScrReviewResultHistory'))
	CREATE NONCLUSTERED INDEX NCIX_AMLScheScrReviewResultHistory_ReviewerBranchID ON AMLScheScrReviewResultHistory (ReviewerBranchID) --INCLUDE ()
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes I WHERE I.Name = 'NCIX_AMLScheScrReviewResultHistory_ReviewDate' AND I.object_id = OBJECT_ID('dbo.AMLScheScrReviewResultHistory'))
	CREATE NONCLUSTERED INDEX NCIX_AMLScheScrReviewResultHistory_ReviewDate ON AMLScheScrReviewResultHistory (ReviewDate) --INCLUDE ()
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes I WHERE I.Name = 'NCIX_AMLScheScrReviewResultHistory_ReviewStatus' AND I.object_id = OBJECT_ID('dbo.AMLScheScrReviewResultHistory'))
	CREATE NONCLUSTERED INDEX NCIX_AMLScheScrReviewResultHistory_ReviewStatus ON AMLScheScrReviewResultHistory (ReviewStatus) --INCLUDE ()
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes I WHERE I.Name = 'NCIX_AMLScheScrReviewResultHistory_ReviewLevel' AND I.object_id = OBJECT_ID('dbo.AMLScheScrReviewResultHistory'))
	CREATE NONCLUSTERED INDEX NCIX_AMLScheScrReviewResultHistory_ReviewLevel ON AMLScheScrReviewResultHistory (ReviewLevel) --INCLUDE ()
GO
/* Index in GlobalConfig Table*/
-- DisplayField,ValueField,FunctionName
IF NOT EXISTS (SELECT 1 FROM sys.indexes I WHERE I.Name = 'NCIX_GlobalConfig_DisplayField' AND I.object_id = OBJECT_ID('dbo.GlobalConfig'))
	CREATE NONCLUSTERED INDEX NCIX_GlobalConfig_DisplayField ON GlobalConfig (DisplayField) --INCLUDE ()
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes I WHERE I.Name = 'NCIX_GlobalConfig_ValueField' AND I.object_id = OBJECT_ID('dbo.GlobalConfig'))
	CREATE NONCLUSTERED INDEX NCIX_GlobalConfig_ValueField ON GlobalConfig (ValueField) --INCLUDE ()
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes I WHERE I.Name = 'NCIX_GlobalConfig_FunctionName' AND I.object_id = OBJECT_ID('dbo.GlobalConfig'))
	CREATE NONCLUSTERED INDEX NCIX_GlobalConfig_FunctionName ON GlobalConfig (FunctionName) --INCLUDE ()
GO
/* Index in SolutionConfig table */
-- DisplayField,ValueField,FunctionName
IF NOT EXISTS (SELECT 1 FROM sys.indexes I WHERE I.Name = 'NCIX_GlobalConfig_DisplayField' AND I.object_id = OBJECT_ID('dbo.SolutionConfig'))
	CREATE NONCLUSTERED INDEX NCIX_GlobalConfig_DisplayField ON SolutionConfig (DisplayField) --INCLUDE ()
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes I WHERE I.Name = 'NCIX_GlobalConfig_ValueField' AND I.object_id = OBJECT_ID('dbo.SolutionConfig'))
	CREATE NONCLUSTERED INDEX NCIX_GlobalConfig_ValueField ON SolutionConfig (ValueField) --INCLUDE ()
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes I WHERE I.Name = 'NCIX_GlobalConfig_FunctionName' AND I.object_id = OBJECT_ID('dbo.SolutionConfig'))
	CREATE NONCLUSTERED INDEX NCIX_GlobalConfig_FunctionName ON SolutionConfig (FunctionName) --INCLUDE ()
GO
/* Index in AMLOnDemandScreening table */
--  TrackingNoCBS CaseID FristName LastName NID MatchID ScreeningDate CustomerType
IF NOT EXISTS (SELECT 1 FROM sys.indexes I WHERE I.Name = 'NCIX_AMLOnDemandScreening_TrackingNoCBS' AND I.object_id = OBJECT_ID('dbo.AMLOnDemandScreening'))
	CREATE NONCLUSTERED INDEX NCIX_AMLOnDemandScreening_TrackingNoCBS ON AMLOnDemandScreening (TrackingNoCBS) --INCLUDE ()
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes I WHERE I.Name = 'NCIX_AMLOnDemandScreening_CaseID' AND I.object_id = OBJECT_ID('dbo.AMLOnDemandScreening'))
	CREATE NONCLUSTERED INDEX NCIX_AMLOnDemandScreening_CaseID ON AMLOnDemandScreening (CaseID) --INCLUDE ()
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes I WHERE I.Name = 'NCIX_AMLOnDemandScreening_MatchID' AND I.object_id = OBJECT_ID('dbo.AMLOnDemandScreening'))
	CREATE NONCLUSTERED INDEX NCIX_AMLOnDemandScreening_MatchID ON AMLOnDemandScreening (MatchID) --INCLUDE ()
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes I WHERE I.Name = 'NCIX_AMLOnDemandScreening_ScreeningDate' AND I.object_id = OBJECT_ID('dbo.AMLOnDemandScreening'))
	CREATE NONCLUSTERED INDEX NCIX_AMLOnDemandScreening_ScreeningDate ON AMLOnDemandScreening (ScreeningDate) --INCLUDE ()
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes I WHERE I.Name = 'NCIX_AMLOnDemandScreening_CustomerType' AND I.object_id = OBJECT_ID('dbo.AMLOnDemandScreening'))
	CREATE NONCLUSTERED INDEX NCIX_AMLOnDemandScreening_CustomerType ON AMLOnDemandScreening (CustomerType) --INCLUDE ()
GO
/* Index on AMLOndemandScrReviewResult table */
--  OndemandScrID, BranchID, ReviewerID, ReviewStatus, ReviewDate,ActiveStatus,LastReviewedByID
IF NOT EXISTS (SELECT 1 FROM sys.indexes I WHERE I.Name = 'NCIX_AMLOndemandScrReviewResult_OndemandScrID' AND I.object_id = OBJECT_ID('dbo.AMLOndemandScrReviewResult'))
	CREATE NONCLUSTERED INDEX NCIX_AMLOndemandScrReviewResult_OndemandScrID ON AMLOndemandScrReviewResult (OndemandScrID) --INCLUDE ()
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes I WHERE I.Name = 'NCIX_AMLOndemandScrReviewResult_BranchID' AND I.object_id = OBJECT_ID('dbo.AMLOndemandScrReviewResult'))
	CREATE NONCLUSTERED INDEX NCIX_AMLOndemandScrReviewResult_BranchID ON AMLOndemandScrReviewResult (BranchID) --INCLUDE ()
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes I WHERE I.Name = 'NCIX_AMLOndemandScrReviewResult_ReviewerID' AND I.object_id = OBJECT_ID('dbo.AMLOndemandScrReviewResult'))
	CREATE NONCLUSTERED INDEX NCIX_AMLOndemandScrReviewResult_ReviewerID ON AMLOndemandScrReviewResult (ReviewerID) --INCLUDE ()
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes I WHERE I.Name = 'NCIX_AMLOndemandScrReviewResult_ReviewStatus' AND I.object_id = OBJECT_ID('dbo.AMLOndemandScrReviewResult'))
	CREATE NONCLUSTERED INDEX NCIX_AMLOndemandScrReviewResult_ReviewStatus ON AMLOndemandScrReviewResult (ReviewStatus) --INCLUDE ()
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes I WHERE I.Name = 'NCIX_AMLOndemandScrReviewResult_ReviewDate' AND I.object_id = OBJECT_ID('dbo.AMLOndemandScrReviewResult'))
	CREATE NONCLUSTERED INDEX NCIX_AMLOndemandScrReviewResult_ReviewDate ON AMLOndemandScrReviewResult (ReviewDate) --INCLUDE ()
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes I WHERE I.Name = 'NCIX_AMLOndemandScrReviewResult_ActiveStatus' AND I.object_id = OBJECT_ID('dbo.AMLOndemandScrReviewResult'))
	CREATE NONCLUSTERED INDEX NCIX_AMLOndemandScrReviewResult_ActiveStatus ON AMLOndemandScrReviewResult (ActiveStatus) INCLUDE (Comments)
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes I WHERE I.Name = 'NCIX_AMLOndemandScrReviewResult_LastReviewedByID' AND I.object_id = OBJECT_ID('dbo.AMLOndemandScrReviewResult'))
	CREATE NONCLUSTERED INDEX NCIX_AMLOndemandScrReviewResult_LastReviewedByID ON AMLOndemandScrReviewResult (LastReviewedByID) --INCLUDE ()
GO
/* Index on AMLOndemandScrReviewResultHistory table */
-- OndemandScrID,ReviewerID,ReviewerBranchID,ReviewStatus,ReviewDate
IF NOT EXISTS (SELECT 1 FROM sys.indexes I WHERE I.Name = 'NCIX_AMLOndemandScrReviewResultHistory_OndemandScrID' AND I.object_id = OBJECT_ID('dbo.AMLOndemandScrReviewResultHistory'))
	CREATE NONCLUSTERED INDEX NCIX_AMLOndemandScrReviewResultHistory_OndemandScrID ON AMLOndemandScrReviewResultHistory (OndemandScrID) --INCLUDE ()
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes I WHERE I.Name = 'NCIX_AMLOndemandScrReviewResultHistory_ReviewerID' AND I.object_id = OBJECT_ID('dbo.AMLOndemandScrReviewResultHistory'))
	CREATE NONCLUSTERED INDEX NCIX_AMLOndemandScrReviewResultHistory_ReviewerID ON AMLOndemandScrReviewResultHistory (ReviewerID) --INCLUDE ()
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes I WHERE I.Name = 'NCIX_AMLOndemandScrReviewResultHistory_ReviewerBranchID' AND I.object_id = OBJECT_ID('dbo.AMLOndemandScrReviewResultHistory'))
	CREATE NONCLUSTERED INDEX NCIX_AMLOndemandScrReviewResultHistory_ReviewerBranchID ON AMLOndemandScrReviewResultHistory (ReviewerBranchID) --INCLUDE ()
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes I WHERE I.Name = 'NCIX_AMLOndemandScrReviewResultHistory_ReviewStatus' AND I.object_id = OBJECT_ID('dbo.AMLOndemandScrReviewResultHistory'))
	CREATE NONCLUSTERED INDEX NCIX_AMLOndemandScrReviewResultHistory_ReviewStatus ON AMLOndemandScrReviewResultHistory (ReviewStatus) --INCLUDE ()
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes I WHERE I.Name = 'NCIX_AMLOndemandScrReviewResultHistory_ReviewDate' AND I.object_id = OBJECT_ID('dbo.AMLOndemandScrReviewResultHistory'))
	CREATE NONCLUSTERED INDEX NCIX_AMLOndemandScrReviewResultHistory_ReviewDate ON AMLOndemandScrReviewResultHistory (ReviewDate) --INCLUDE ()
GO
/* Index on UserPrivileges table*/
-- MenuId,IsActive,UserId
IF NOT EXISTS (SELECT 1 FROM sys.indexes I WHERE I.Name = 'NCIX_UserPrivileges_MenuId' AND I.object_id = OBJECT_ID('dbo.UserPrivileges'))
	CREATE NONCLUSTERED INDEX NCIX_UserPrivileges_MenuId ON UserPrivileges (MenuId) --INCLUDE ()
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes I WHERE I.Name = 'NCIX_UserPrivileges_IsActive' AND I.object_id = OBJECT_ID('dbo.UserPrivileges'))
	CREATE NONCLUSTERED INDEX NCIX_UserPrivileges_IsActive ON UserPrivileges (IsActive) --INCLUDE ()
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes I WHERE I.Name = 'NCIX_UserPrivileges_UserId' AND I.object_id = OBJECT_ID('dbo.UserPrivileges'))
	CREATE NONCLUSTERED INDEX NCIX_UserPrivileges_UserId ON UserPrivileges (UserId) --INCLUDE ()
GO
/* Index on AMLBulkCustomer */
-- BranchId,ReceiverName,ScreeningDate,SenderName,TrackingNumber
IF NOT EXISTS (SELECT 1 FROM sys.indexes I WHERE I.Name = 'NCIX_AMLBulkCustomer_BranchId' AND I.object_id = OBJECT_ID('dbo.AMLBulkCustomer'))
	CREATE NONCLUSTERED INDEX NCIX_AMLBulkCustomer_BranchId ON AMLBulkCustomer (BranchId) --INCLUDE ()
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes I WHERE I.Name = 'NCIX_AMLBulkCustomer_ReceiverName' AND I.object_id = OBJECT_ID('dbo.AMLBulkCustomer'))
	CREATE NONCLUSTERED INDEX NCIX_AMLBulkCustomer_ReceiverName ON AMLBulkCustomer (ReceiverName) --INCLUDE ()
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes I WHERE I.Name = 'NCIX_AMLBulkCustomer_ScreeningDate' AND I.object_id = OBJECT_ID('dbo.AMLBulkCustomer'))
	CREATE NONCLUSTERED INDEX NCIX_AMLBulkCustomer_ScreeningDate ON AMLBulkCustomer (ScreeningDate) --INCLUDE ()
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes I WHERE I.Name = 'NCIX_AMLBulkCustomer_SenderName' AND I.object_id = OBJECT_ID('dbo.AMLBulkCustomer'))
	CREATE NONCLUSTERED INDEX NCIX_AMLBulkCustomer_SenderName ON AMLBulkCustomer (SenderName) --INCLUDE ()
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes I WHERE I.Name = 'NCIX_AMLBulkCustomer_TrackingNumber' AND I.object_id = OBJECT_ID('dbo.AMLBulkCustomer'))
	CREATE NONCLUSTERED INDEX NCIX_AMLBulkCustomer_TrackingNumber ON AMLBulkCustomer (TrackingNumber) --INCLUDE ()
GO
/* Index on AMLRemittanceScreening table*/
-- CaseID,FristName,LastName,MatchID,ScreeningDate,CustomerType,TableName
IF NOT EXISTS (SELECT 1 FROM sys.indexes I WHERE I.Name = 'NCIX_AMLRemittanceScreening_CustomerType' AND I.object_id = OBJECT_ID('dbo.AMLRemittanceScreening'))
	CREATE NONCLUSTERED INDEX NCIX_AMLRemittanceScreening_CustomerType ON AMLRemittanceScreening (CustomerType) --INCLUDE (Comments)  ON [PRIMARY]
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes I WHERE I.Name = 'NCIX_AMLRemittanceScreening_TableName' AND I.object_id = OBJECT_ID('dbo.AMLRemittanceScreening'))
	CREATE NONCLUSTERED INDEX NCIX_AMLRemittanceScreening_TableName ON AMLRemittanceScreening (TableName) --INCLUDE (Comments)  ON [PRIMARY]
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes I WHERE I.Name = 'NCIX_AMLRemittanceScreening_CaseID' AND I.object_id = OBJECT_ID('dbo.AMLRemittanceScreening'))
	CREATE NONCLUSTERED INDEX NCIX_AMLRemittanceScreening_CaseID ON AMLRemittanceScreening (CaseID) --INCLUDE (Comments)  ON [PRIMARY]
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes I WHERE I.Name = 'NCIX_AMLRemittanceScreening_FristName' AND I.object_id = OBJECT_ID('dbo.AMLRemittanceScreening'))
	CREATE NONCLUSTERED INDEX NCIX_AMLRemittanceScreening_FristName ON AMLRemittanceScreening (FristName) --INCLUDE (Comments)  ON [PRIMARY]
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes I WHERE I.Name = 'NCIX_AMLRemittanceScreening_LastName' AND I.object_id = OBJECT_ID('dbo.AMLRemittanceScreening'))
	CREATE NONCLUSTERED INDEX NCIX_AMLRemittanceScreening_LastName ON AMLRemittanceScreening (LastName) --INCLUDE (Comments)  ON [PRIMARY]
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes I WHERE I.Name = 'NCIX_AMLRemittanceScreening_MatchID' AND I.object_id = OBJECT_ID('dbo.AMLRemittanceScreening'))
	CREATE NONCLUSTERED INDEX NCIX_AMLRemittanceScreening_MatchID ON AMLRemittanceScreening (MatchID) --INCLUDE (Comments)  ON [PRIMARY]
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes I WHERE I.Name = 'NCIX_AMLRemittanceScreening_ScreeningDate' AND I.object_id = OBJECT_ID('dbo.AMLRemittanceScreening'))
	CREATE NONCLUSTERED INDEX NCIX_AMLRemittanceScreening_ScreeningDate ON AMLRemittanceScreening (ScreeningDate) --INCLUDE (Comments)  ON [PRIMARY]
GO
/* Index on AMLRemittanceScrReviewResult table*/
-- ActiveStatus,OndemandScrID,BranchID,ReviewerID,ReviewStatus,ReviewDate,Reviewlevel
IF NOT EXISTS (SELECT 1 FROM sys.indexes I WHERE I.Name = 'NCIX_AMLRemittanceScrReviewResult_ActiveStatus' AND I.object_id = OBJECT_ID('dbo.AMLRemittanceScrReviewResult'))
	CREATE NONCLUSTERED INDEX NCIX_AMLRemittanceScrReviewResult_ActiveStatus ON AMLRemittanceScrReviewResult (ActiveStatus) INCLUDE (Comments)  ON [PRIMARY]
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes I WHERE I.Name = 'NCIX_AMLRemittanceScrReviewResult_OndemandScrID' AND I.object_id = OBJECT_ID('dbo.AMLRemittanceScrReviewResult'))
	CREATE NONCLUSTERED INDEX NCIX_AMLRemittanceScrReviewResult_OndemandScrID ON AMLRemittanceScrReviewResult (OndemandScrID) --INCLUDE (Comments)  ON [PRIMARY]
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes I WHERE I.Name = 'NCIX_AMLRemittanceScrReviewResult_BranchID' AND I.object_id = OBJECT_ID('dbo.AMLRemittanceScrReviewResult'))
	CREATE NONCLUSTERED INDEX NCIX_AMLRemittanceScrReviewResult_BranchID ON AMLRemittanceScrReviewResult (BranchID) --INCLUDE (Comments)  ON [PRIMARY]
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes I WHERE I.Name = 'NCIX_AMLRemittanceScrReviewResult_ReviewerID' AND I.object_id = OBJECT_ID('dbo.AMLRemittanceScrReviewResult'))
	CREATE NONCLUSTERED INDEX NCIX_AMLRemittanceScrReviewResult_ReviewerID ON AMLRemittanceScrReviewResult (ReviewerID) --INCLUDE (Comments)  ON [PRIMARY]
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes I WHERE I.Name = 'NCIX_AMLRemittanceScrReviewResult_ReviewDate' AND I.object_id = OBJECT_ID('dbo.AMLRemittanceScrReviewResult'))
	CREATE NONCLUSTERED INDEX NCIX_AMLRemittanceScrReviewResult_ReviewDate ON AMLRemittanceScrReviewResult (ReviewDate) --INCLUDE (Comments)  ON [PRIMARY]
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes I WHERE I.Name = 'NCIX_AMLRemittanceScrReviewResult_Reviewlevel' AND I.object_id = OBJECT_ID('dbo.AMLRemittanceScrReviewResult'))
	CREATE NONCLUSTERED INDEX NCIX_AMLRemittanceScrReviewResult_Reviewlevel ON AMLRemittanceScrReviewResult (Reviewlevel) --INCLUDE (Comments)  ON [PRIMARY]
GO
/* Index on AMLRemittanceScrReviewResultHistory table*/
-- OndemandScrID,ReviewerID,ReviewerBranchID,ReviewStatus,ReviewDate
IF NOT EXISTS (SELECT 1 FROM sys.indexes I WHERE I.Name = 'NCIX_AMLRemittanceScrReviewResultHistory_OndemandScrID' AND I.object_id = OBJECT_ID('dbo.AMLRemittanceScrReviewResultHistory'))
	CREATE NONCLUSTERED INDEX NCIX_AMLRemittanceScrReviewResultHistory_OndemandScrID ON AMLRemittanceScrReviewResultHistory (OndemandScrID) --INCLUDE (Comments)  ON [PRIMARY]
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes I WHERE I.Name = 'NCIX_AMLRemittanceScrReviewResultHistory_ReviewerID' AND I.object_id = OBJECT_ID('dbo.AMLRemittanceScrReviewResultHistory'))
	CREATE NONCLUSTERED INDEX NCIX_AMLRemittanceScrReviewResultHistory_ReviewerID ON AMLRemittanceScrReviewResultHistory (ReviewerID) --INCLUDE (Comments)  ON [PRIMARY]
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes I WHERE I.Name = 'NCIX_AMLRemittanceScrReviewResultHistory_ReviewerBranchID' AND I.object_id = OBJECT_ID('dbo.AMLRemittanceScrReviewResultHistory'))
	CREATE NONCLUSTERED INDEX NCIX_AMLRemittanceScrReviewResultHistory_ReviewerBranchID ON AMLRemittanceScrReviewResultHistory (ReviewerBranchID) --INCLUDE (Comments)  ON [PRIMARY]
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes I WHERE I.Name = 'NCIX_AMLRemittanceScrReviewResultHistory_ReviewStatus' AND I.object_id = OBJECT_ID('dbo.AMLRemittanceScrReviewResultHistory'))
	CREATE NONCLUSTERED INDEX NCIX_AMLRemittanceScrReviewResultHistory_ReviewStatus ON AMLRemittanceScrReviewResultHistory (ReviewStatus) --INCLUDE (Comments)  ON [PRIMARY]
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes I WHERE I.Name = 'NCIX_AMLRemittanceScrReviewResultHistory_ReviewDate' AND I.object_id = OBJECT_ID('dbo.AMLRemittanceScrReviewResultHistory'))
	CREATE NONCLUSTERED INDEX NCIX_AMLRemittanceScrReviewResultHistory_ReviewDate ON AMLRemittanceScrReviewResultHistory (ReviewDate) --INCLUDE (Comments)  ON [PRIMARY]
GO
/* Index on RolePrivilages*/
-- RoleId ModuleName IsActive
IF NOT EXISTS (SELECT 1 FROM sys.indexes I WHERE I.Name = 'NCIX_RolePrivilages_RoleId' AND I.object_id = OBJECT_ID('dbo.RolePrivilages'))
	CREATE NONCLUSTERED INDEX NCIX_RolePrivilages_RoleId ON RolePrivilages (RoleId) --INCLUDE (Comments)  ON [PRIMARY]
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes I WHERE I.Name = 'NCIX_RolePrivilages_ModuleName' AND I.object_id = OBJECT_ID('dbo.RolePrivilages'))
	CREATE NONCLUSTERED INDEX NCIX_RolePrivilages_ModuleName ON RolePrivilages (ModuleName) --INCLUDE (Comments)  ON [PRIMARY]
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes I WHERE I.Name = 'NCIX_RolePrivilages_IsActive' AND I.object_id = OBJECT_ID('dbo.RolePrivilages'))
	CREATE NONCLUSTERED INDEX NCIX_RolePrivilages_IsActive ON RolePrivilages (IsActive) --INCLUDE (Comments)  ON [PRIMARY]
GO
/* Index on Users*/
-- RoleId ActiveStatus
IF NOT EXISTS (SELECT 1 FROM sys.indexes I WHERE I.Name = 'NCIX_Users_RoleId' AND I.object_id = OBJECT_ID('dbo.Users'))
	CREATE NONCLUSTERED INDEX NCIX_Users_RoleId ON Users (RoleId) --INCLUDE (Comments)  ON [PRIMARY]
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes I WHERE I.Name = 'NCIX_Users_ActiveStatus' AND I.object_id = OBJECT_ID('dbo.Users'))
	CREATE NONCLUSTERED INDEX NCIX_Users_ActiveStatus ON Users (ActiveStatus) --INCLUDE (Comments)  ON [PRIMARY]
GO
/* Index on AMLSwiftMsgDetails */
-- SWIFTMessageID, MatchFields,MatchFieldsValue,City,Country,CustomerType,ReviewDate
IF NOT EXISTS (SELECT 1 FROM sys.indexes I WHERE I.Name = 'NCIX_AMLSwiftMsgDetails_SWIFTMessageID' AND I.object_id = OBJECT_ID('dbo.AMLSwiftMsgDetails'))
	CREATE NONCLUSTERED INDEX NCIX_AMLSwiftMsgDetails_SWIFTMessageID ON AMLSwiftMsgDetails (SWIFTMessageID) --INCLUDE (Comments)  ON [PRIMARY]
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes I WHERE I.Name = 'NCIX_AMLSwiftMsgDetails_MatchFields' AND I.object_id = OBJECT_ID('dbo.AMLSwiftMsgDetails'))
	CREATE NONCLUSTERED INDEX NCIX_AMLSwiftMsgDetails_MatchFields ON AMLSwiftMsgDetails (MatchFields) --INCLUDE (Comments)  ON [PRIMARY]
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes I WHERE I.Name = 'NCIX_AMLSwiftMsgDetails_MatchFieldsValue' AND I.object_id = OBJECT_ID('dbo.AMLSwiftMsgDetails'))
	CREATE NONCLUSTERED INDEX NCIX_AMLSwiftMsgDetails_MatchFieldsValue ON AMLSwiftMsgDetails (MatchFieldsValue) --INCLUDE (Comments)  ON [PRIMARY]
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes I WHERE I.Name = 'NCIX_AMLSwiftMsgDetails_City' AND I.object_id = OBJECT_ID('dbo.AMLSwiftMsgDetails'))
	CREATE NONCLUSTERED INDEX NCIX_AMLSwiftMsgDetails_City ON AMLSwiftMsgDetails (City) --INCLUDE (Comments)  ON [PRIMARY]
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes I WHERE I.Name = 'NCIX_AMLSwiftMsgDetails_Country' AND I.object_id = OBJECT_ID('dbo.AMLSwiftMsgDetails'))
	CREATE NONCLUSTERED INDEX NCIX_AMLSwiftMsgDetails_Country ON AMLSwiftMsgDetails (Country) --INCLUDE (Comments)  ON [PRIMARY]
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes I WHERE I.Name = 'NCIX_AMLSwiftMsgDetails_CustomerType' AND I.object_id = OBJECT_ID('dbo.AMLSwiftMsgDetails'))
	CREATE NONCLUSTERED INDEX NCIX_AMLSwiftMsgDetails_CustomerType ON AMLSwiftMsgDetails (CustomerType) --INCLUDE (Comments)  ON [PRIMARY]
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes I WHERE I.Name = 'NCIX_AMLSwiftMsgDetails_ReviewDate' AND I.object_id = OBJECT_ID('dbo.AMLSwiftMsgDetails'))
	CREATE NONCLUSTERED INDEX NCIX_AMLSwiftMsgDetails_ReviewDate ON AMLSwiftMsgDetails (ReviewDate) --INCLUDE (Comments)  ON [PRIMARY]
GO
/* Index on AMLSWIFTReviewResult */
-- SWIFTMessageID, ReviewerID,Reviewlevel,ReviewStatus,ActiveStatus,ReviewDate
IF NOT EXISTS (SELECT 1 FROM sys.indexes I WHERE I.Name = 'NCIX_AMLSWIFTReviewResult_SWIFTMessageID' AND I.object_id = OBJECT_ID('dbo.AMLSWIFTReviewResult'))
	CREATE NONCLUSTERED INDEX NCIX_AMLSWIFTReviewResult_SWIFTMessageID ON AMLSWIFTReviewResult (SWIFTMessageID) --INCLUDE (Comments)  ON [PRIMARY]
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes I WHERE I.Name = 'NCIX_AMLSWIFTReviewResult_ReviewerID' AND I.object_id = OBJECT_ID('dbo.AMLSWIFTReviewResult'))
	CREATE NONCLUSTERED INDEX NCIX_AMLSWIFTReviewResult_ReviewerID ON AMLSWIFTReviewResult (ReviewerID) --INCLUDE (Comments)  ON [PRIMARY]
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes I WHERE I.Name = 'NCIX_AMLSWIFTReviewResult_Reviewlevel' AND I.object_id = OBJECT_ID('dbo.AMLSWIFTReviewResult'))
	CREATE NONCLUSTERED INDEX NCIX_AMLSWIFTReviewResult_Reviewlevel ON AMLSWIFTReviewResult (Reviewlevel) --INCLUDE (Comments)  ON [PRIMARY]
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes I WHERE I.Name = 'NCIX_AMLSWIFTReviewResult_ReviewStatus' AND I.object_id = OBJECT_ID('dbo.AMLSWIFTReviewResult'))
	CREATE NONCLUSTERED INDEX NCIX_AMLSWIFTReviewResult_ReviewStatus ON AMLSWIFTReviewResult (ReviewStatus) --INCLUDE (Comments)  ON [PRIMARY]
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes I WHERE I.Name = 'NCIX_AMLSWIFTReviewResult_ActiveStatus' AND I.object_id = OBJECT_ID('dbo.AMLSWIFTReviewResult'))
	CREATE NONCLUSTERED INDEX NCIX_AMLSWIFTReviewResult_ActiveStatus ON AMLSWIFTReviewResult (ActiveStatus) --INCLUDE (Comments)  ON [PRIMARY]
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes I WHERE I.Name = 'NCIX_AMLSWIFTReviewResult_ReviewDate' AND I.object_id = OBJECT_ID('dbo.AMLSWIFTReviewResult'))
	CREATE NONCLUSTERED INDEX NCIX_AMLSWIFTReviewResult_ReviewDate ON AMLSWIFTReviewResult (ReviewDate) --INCLUDE (Comments)  ON [PRIMARY]
GO
/* Index on AMLSWIFTReviewResultHistory */
-- SWIFTMessageID, ReviewerID,Reviewlevel,ReviewStatus,ReviewDate
IF NOT EXISTS (SELECT 1 FROM sys.indexes I WHERE I.Name = 'NCIX_AMLSWIFTReviewResultHistory_SWIFTMessageID' AND I.object_id = OBJECT_ID('dbo.AMLSWIFTReviewResultHistory'))
	CREATE NONCLUSTERED INDEX NCIX_AMLSWIFTReviewResultHistory_SWIFTMessageID ON AMLSWIFTReviewResultHistory (SWIFTMessageID) --INCLUDE (Comments)  ON [PRIMARY]
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes I WHERE I.Name = 'NCIX_AMLSWIFTReviewResultHistory_ReviewerID' AND I.object_id = OBJECT_ID('dbo.AMLSWIFTReviewResultHistory'))
	CREATE NONCLUSTERED INDEX NCIX_AMLSWIFTReviewResultHistory_ReviewerID ON AMLSWIFTReviewResultHistory (ReviewerID) --INCLUDE (Comments)  ON [PRIMARY]
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes I WHERE I.Name = 'NCIX_AMLSWIFTReviewResultHistory_Reviewlevel' AND I.object_id = OBJECT_ID('dbo.AMLSWIFTReviewResultHistory'))
	CREATE NONCLUSTERED INDEX NCIX_AMLSWIFTReviewResultHistory_Reviewlevel ON AMLSWIFTReviewResultHistory (Reviewlevel) --INCLUDE (Comments)  ON [PRIMARY]
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes I WHERE I.Name = 'NCIX_AMLSWIFTReviewResultHistory_ReviewStatus' AND I.object_id = OBJECT_ID('dbo.AMLSWIFTReviewResultHistory'))
	CREATE NONCLUSTERED INDEX NCIX_AMLSWIFTReviewResultHistory_ReviewStatus ON AMLSWIFTReviewResultHistory (ReviewStatus) --INCLUDE (Comments)  ON [PRIMARY]
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes I WHERE I.Name = 'NCIX_AMLSWIFTReviewResultHistory_ReviewDate' AND I.object_id = OBJECT_ID('dbo.AMLSWIFTReviewResultHistory'))
	CREATE NONCLUSTERED INDEX NCIX_AMLSWIFTReviewResultHistory_ReviewDate ON AMLSWIFTReviewResultHistory (ReviewDate) --INCLUDE (Comments)  ON [PRIMARY]
GO
/* Index on CustomerConfigurations */
-- ColumnName,Tab,RiskFor,DataType,ReferenceTable,DataLength,IsMandatory,IsActive,IsEditable,IsKycIncomplete,IsIndividual

IF NOT EXISTS (SELECT 1 FROM sys.indexes I WHERE I.Name = 'NCIX_CustomerConfigurations_IsActive' AND I.object_id = OBJECT_ID('dbo.CustomerConfigurations'))
	CREATE NONCLUSTERED INDEX NCIX_CustomerConfigurations_IsActive ON CustomerConfigurations (IsActive) --INCLUDE (Comments)  ON [PRIMARY]
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes I WHERE I.Name = 'NCIX_CustomerConfigurations_IsEditable' AND I.object_id = OBJECT_ID('dbo.CustomerConfigurations'))
	CREATE NONCLUSTERED INDEX NCIX_CustomerConfigurations_IsEditable ON CustomerConfigurations (IsEditable) --INCLUDE (Comments)  ON [PRIMARY]
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes I WHERE I.Name = 'NCIX_CustomerConfigurations_IsKycIncomplete' AND I.object_id = OBJECT_ID('dbo.CustomerConfigurations'))
	CREATE NONCLUSTERED INDEX NCIX_CustomerConfigurations_IsKycIncomplete ON CustomerConfigurations (IsKycIncomplete) --INCLUDE (Comments)  ON [PRIMARY]
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes I WHERE I.Name = 'NCIX_CustomerConfigurations_IsIndividual' AND I.object_id = OBJECT_ID('dbo.CustomerConfigurations'))
	CREATE NONCLUSTERED INDEX NCIX_CustomerConfigurations_IsIndividual ON CustomerConfigurations (IsIndividual) --INCLUDE (Comments)  ON [PRIMARY]
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes I WHERE I.Name = 'NCIX_CustomerConfigurations_ColumnName' AND I.object_id = OBJECT_ID('dbo.CustomerConfigurations'))
	CREATE NONCLUSTERED INDEX NCIX_CustomerConfigurations_ColumnName ON CustomerConfigurations (ColumnName) --INCLUDE (Comments)  ON [PRIMARY]
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes I WHERE I.Name = 'NCIX_CustomerConfigurations_Tab' AND I.object_id = OBJECT_ID('dbo.CustomerConfigurations'))
	CREATE NONCLUSTERED INDEX NCIX_CustomerConfigurations_Tab ON CustomerConfigurations (Tab) --INCLUDE (Comments)  ON [PRIMARY]
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes I WHERE I.Name = 'NCIX_CustomerConfigurations_RiskFor' AND I.object_id = OBJECT_ID('dbo.CustomerConfigurations'))
	CREATE NONCLUSTERED INDEX NCIX_CustomerConfigurations_RiskFor ON CustomerConfigurations (RiskFor) --INCLUDE (Comments)  ON [PRIMARY]
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes I WHERE I.Name = 'NCIX_CustomerConfigurations_DataType' AND I.object_id = OBJECT_ID('dbo.CustomerConfigurations'))
	CREATE NONCLUSTERED INDEX NCIX_CustomerConfigurations_DataType ON CustomerConfigurations (DataType) --INCLUDE (Comments)  ON [PRIMARY]
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes I WHERE I.Name = 'NCIX_CustomerConfigurations_ReferenceTable' AND I.object_id = OBJECT_ID('dbo.CustomerConfigurations'))
	CREATE NONCLUSTERED INDEX NCIX_CustomerConfigurations_ReferenceTable ON CustomerConfigurations (ReferenceTable) --INCLUDE (Comments)  ON [PRIMARY]
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes I WHERE I.Name = 'NCIX_CustomerConfigurations_DataLength' AND I.object_id = OBJECT_ID('dbo.CustomerConfigurations'))
	CREATE NONCLUSTERED INDEX NCIX_CustomerConfigurations_DataLength ON CustomerConfigurations (DataLength) --INCLUDE (Comments)  ON [PRIMARY]
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes I WHERE I.Name = 'NCIX_CustomerConfigurations_IsMandatory' AND I.object_id = OBJECT_ID('dbo.CustomerConfigurations'))
	CREATE NONCLUSTERED INDEX NCIX_CustomerConfigurations_IsMandatory ON CustomerConfigurations (IsMandatory) --INCLUDE (Comments)  ON [PRIMARY]
GO
/* Index on MenuConfigs */
-- RoleId,ParentId,Active
IF NOT EXISTS (SELECT 1 FROM sys.indexes I WHERE I.Name = 'NCIX_MenuConfigs_RoleId' AND I.object_id = OBJECT_ID('dbo.MenuConfigs'))
	CREATE NONCLUSTERED INDEX NCIX_MenuConfigs_RoleId ON MenuConfigs (RoleId) --INCLUDE (Comments)  ON [PRIMARY]
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes I WHERE I.Name = 'NCIX_MenuConfigs_ParentId' AND I.object_id = OBJECT_ID('dbo.MenuConfigs'))
	CREATE NONCLUSTERED INDEX NCIX_MenuConfigs_ParentId ON MenuConfigs (ParentId) --INCLUDE (Comments)  ON [PRIMARY]
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes I WHERE I.Name = 'NCIX_MenuConfigs_Active' AND I.object_id = OBJECT_ID('dbo.MenuConfigs'))
	CREATE NONCLUSTERED INDEX NCIX_MenuConfigs_Active ON MenuConfigs (Active) --INCLUDE (Comments)  ON [PRIMARY]
GO
/* Index on ScreeningListConfig */
-- ListName ,IsSelected
IF NOT EXISTS (SELECT 1 FROM sys.indexes I WHERE I.Name = 'NCIX_ScreeningListConfig_ListName' AND I.object_id = OBJECT_ID('dbo.ScreeningListConfig'))
	CREATE NONCLUSTERED INDEX NCIX_ScreeningListConfig_ListName ON ScreeningListConfig (ListName) --INCLUDE (Comments)  ON [PRIMARY]
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes I WHERE I.Name = 'NCIX_ScreeningListConfig_IsSelected' AND I.object_id = OBJECT_ID('dbo.ScreeningListConfig'))
	CREATE NONCLUSTERED INDEX NCIX_ScreeningListConfig_IsSelected ON ScreeningListConfig (IsSelected) --INCLUDE (Comments)  ON [PRIMARY]
GO
/* Index on States */
-- States City
IF NOT EXISTS (SELECT 1 FROM sys.indexes I WHERE I.Name = 'NCIX_States_State' AND I.object_id = OBJECT_ID('dbo.States'))
	CREATE NONCLUSTERED INDEX NCIX_States_State ON States (State) --INCLUDE (Comments)  ON [PRIMARY]
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes I WHERE I.Name = 'NCIX_States_City' AND I.object_id = OBJECT_ID('dbo.States'))
	CREATE NONCLUSTERED INDEX NCIX_States_City ON States (City) --INCLUDE (Comments)  ON [PRIMARY]
GO
/* Index on Roles */
-- RoleName ,ActiveStatus
IF NOT EXISTS (SELECT 1 FROM sys.indexes I WHERE I.Name = 'NCIX_Roles_RoleName' AND I.object_id = OBJECT_ID('dbo.Roles'))
	CREATE NONCLUSTERED INDEX NCIX_Roles_RoleName ON Roles (RoleName) --INCLUDE (Comments)  ON [PRIMARY]
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes I WHERE I.Name = 'NCIX_Roles_ActiveStatus' AND I.object_id = OBJECT_ID('dbo.Roles'))
	CREATE NONCLUSTERED INDEX NCIX_Roles_ActiveStatus ON Roles (ActiveStatus) --INCLUDE (Comments)  ON [PRIMARY]
GO
/* Index on DropDownValues */
-- CBSCode,ColumnName,Name
IF NOT EXISTS (SELECT 1 FROM sys.indexes I WHERE I.Name = 'NCIX_DropDownValues_CBSCode' AND I.object_id = OBJECT_ID('dbo.DropDownValues'))
	CREATE NONCLUSTERED INDEX NCIX_DropDownValues_CBSCode ON DropDownValues (CBSCode) --INCLUDE (Comments)  ON [PRIMARY]
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes I WHERE I.Name = 'NCIX_DropDownValues_ColumnName' AND I.object_id = OBJECT_ID('dbo.DropDownValues'))
	CREATE NONCLUSTERED INDEX NCIX_DropDownValues_ColumnName ON DropDownValues (ColumnName) --INCLUDE (Comments)  ON [PRIMARY]
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes I WHERE I.Name = 'NCIX_DropDownValues_Name' AND I.object_id = OBJECT_ID('dbo.DropDownValues'))
	CREATE NONCLUSTERED INDEX NCIX_DropDownValues_Name ON DropDownValues (Name) --INCLUDE (Comments)  ON [PRIMARY]
GO
/* Index on UserAccess */
-- UserId,BranchId
IF NOT EXISTS (SELECT 1 FROM sys.indexes I WHERE I.Name = 'NCIX_UserAccess_UserId' AND I.object_id = OBJECT_ID('dbo.UserAccess'))
	CREATE NONCLUSTERED INDEX NCIX_UserAccess_UserId ON UserAccess (UserId) --INCLUDE (Comments)  ON [PRIMARY]
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes I WHERE I.Name = 'NCIX_UserAccess_BranchId' AND I.object_id = OBJECT_ID('dbo.UserAccess'))
	CREATE NONCLUSTERED INDEX NCIX_UserAccess_BranchId ON UserAccess (BranchId) --INCLUDE (Comments)  ON [PRIMARY]
GO
/* Index on AccountRisk */
-- NoOfTransactions,NoOfCashTransactions,CustomerAccountId,ValueOfTransactions,ValueOfCashTransactions
IF NOT EXISTS (SELECT 1 FROM sys.indexes I WHERE I.Name = 'NCIX_AccountRisk_NoOfTransactions' AND I.object_id = OBJECT_ID('dbo.AccountRisk'))
	CREATE NONCLUSTERED INDEX NCIX_AccountRisk_NoOfTransactions ON AccountRisk (NoOfTransactions) --INCLUDE (Comments)  ON [PRIMARY]
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes I WHERE I.Name = 'NCIX_AccountRisk_NoOfCashTransactions' AND I.object_id = OBJECT_ID('dbo.AccountRisk'))
	CREATE NONCLUSTERED INDEX NCIX_AccountRisk_NoOfCashTransactions ON AccountRisk (NoOfCashTransactions) --INCLUDE (Comments)  ON [PRIMARY]
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes I WHERE I.Name = 'NCIX_AccountRisk_CustomerAccountId' AND I.object_id = OBJECT_ID('dbo.AccountRisk'))
	CREATE NONCLUSTERED INDEX NCIX_AccountRisk_CustomerAccountId ON AccountRisk (CustomerAccountId) --INCLUDE (Comments)  ON [PRIMARY]
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes I WHERE I.Name = 'NCIX_AccountRisk_ValueOfTransactions' AND I.object_id = OBJECT_ID('dbo.AccountRisk'))
	CREATE NONCLUSTERED INDEX NCIX_AccountRisk_ValueOfTransactions ON AccountRisk (ValueOfTransactions) --INCLUDE (Comments)  ON [PRIMARY]
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes I WHERE I.Name = 'NCIX_AccountRisk_ValueOfCashTransactions' AND I.object_id = OBJECT_ID('dbo.AccountRisk'))
	CREATE NONCLUSTERED INDEX NCIX_AccountRisk_ValueOfCashTransactions ON AccountRisk (ValueOfCashTransactions) --INCLUDE (Comments)  ON [PRIMARY]
GO

-- DROP INDEX NCIX_AccountInformations_AccountId ON AccountInformations

