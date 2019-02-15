IF EXISTS (SELECT * FROM sys.types WHERE NAME = 'StructuringData')
    DROP TYPE StructuringData 
GO
CREATE TYPE dbo.StructuringData as TABLE(
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StrId] [int] NULL,
	[CustomerId] [int] NULL,
	[CustomerType] [nvarchar](50) NULL,
	[TxnDate] [datetime] NULL,
	[TxnType] [nvarchar](50) NULL,
	[TxnMedia] [nvarchar](50) NULL,
	[AccCount] [int] NULL,
	[TxnCount] [int] NULL,
	[TxnAmount] [decimal](18, 0) NULL,
	[ViolatedRule] [nvarchar](50) NULL,
	[ScoredLabel] [nvarchar](50) NULL,
	[ScoredProbability] [decimal](18, 0) NULL
	)
GO
CREATE PROCEDURE usp_InsertBigScreenProducts
(


      @TableVariable StructuringData READONLY


)
AS
BEGIN


PRINT('')
END

GO