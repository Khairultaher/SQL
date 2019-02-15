
IF OBJECT_ID(N'dbo.IndTestingCategories','U') IS NULL
	CREATE TABLE [dbo].[IndTestingCategories]
	(
		[Id] [int] IDENTITY(1,1) NOT NULL,
		[CategoryName] [nvarchar](150) NOT NULL,
		[Score] [float] NOT NULL,
	)
GO
-- Add Primary Key Constraint
IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'PK_IndTestingCategories'))
	ALTER TABLE IndTestingCategories ADD  CONSTRAINT [PK_IndTestingCategories] PRIMARY KEY CLUSTERED 
	(
		[Id] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
-- Add Forign Key Constraint
IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'FK_IndTestingQuestions_IndTestingCategories'))
	ALTER TABLE [dbo].[IndTestingCategories]  WITH CHECK ADD  CONSTRAINT [FK_IndTestingQuestions_IndTestingCategories] FOREIGN KEY([CategoryId])
	REFERENCES [dbo].[IndTestingCategories] ([Id])
GO
-- Add Default Key Constraint
IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'FK_IndTestingQuestions_IndTestingCategories'))
	ALTER TABLE [dbo].[IndTestingCategories] ADD  CONSTRAINT [DF_IndTesting2_Modify]  DEFAULT (getdate()) FOR [Modify]
GO
---Update Table By Adding a New Column
IF NOT EXISTS(SELECT 1 FROM sys.columns WHERE Name = N'DisplaySerial' AND Object_ID = Object_ID(N'dbo.IndTestingCategories'))
	ALTER TABLE IndTestingCategories ADD DisplaySerial  int NULL
GO
--IF Want To Add Default Key Constraint New Column.
IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'DF_IndTestingQuestions_DisplaySerial'))
	ALTER TABLE [dbo].[IndTestingCategories] ADD  CONSTRAINT [DF_IndTestingQuestions_DisplaySerial]  DEFAULT (0) FOR [DisplaySerial]
GO
