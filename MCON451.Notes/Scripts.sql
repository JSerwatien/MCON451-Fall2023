CREATE DATABASE [MCON451]
GO
USE MCON451
GO
CREATE TABLE [dbo].[Campaign](
	[CampaignKey] [int] IDENTITY(1,1) NOT NULL,
	[CampaignCode] [varchar](5) NULL,
	[Description] [varchar](50) NOT NULL,
	[FromDate] [datetime] NOT NULL,
	[ThruDate] [datetime] NULL,
	[ActiveInd] [tinyint] NULL,
	[Icon] [varchar](50) NULL,
	[CreatedDateTime] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[LastUpdatedDateTime] [datetime] NULL,
	[LastUpdatedBy] [varchar](50) NULL,
 CONSTRAINT [PK_Campaign] PRIMARY KEY CLUSTERED 
(
	[CampaignKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Chain](
	[ChainKey] [int] IDENTITY(1,1) NOT NULL,
	[ChainName] [varchar](50) NOT NULL,
	[ActiveInd] [tinyint] NULL,
	[CreatedDateTime] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[LastUpdatedDateTime] [datetime] NULL,
	[LastUpdatedBy] [varchar](50) NULL,
 CONSTRAINT [PK_Chain] PRIMARY KEY CLUSTERED 
(
	[ChainKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[MonthlySales](
	[MonthlySalesKey] [int] IDENTITY(1,1) NOT NULL,
	[StoreSalesRepresentativeKey] [int] NOT NULL,
	[SalesMonth] [int] NOT NULL,
	[SalesYear] [int] NOT NULL,
	[SalesAmount] [decimal](18, 2) NOT NULL,
	[CampaignKey] [int] NULL,
	[CreatedDateTime] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[LastUpdatedDateTime] [datetime] NULL,
	[LastUpdatedBy] [varchar](50) NULL,
 CONSTRAINT [PK_MonthlySales] PRIMARY KEY CLUSTERED 
(
	[MonthlySalesKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[SalesRepresentative](
	[SalesRepresentativeKey] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[ActiveInd] [tinyint] NULL,
	[CreatedDateTime] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[LastUpdatedDateTime] [datetime] NULL,
	[LastUpdatedBy] [varchar](50) NULL,
 CONSTRAINT [PK_SalesRepresentative] PRIMARY KEY CLUSTERED 
(
	[SalesRepresentativeKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Store](
	[StoreKey] [int] IDENTITY(1,1) NOT NULL,
	[ChainKey] [int] NOT NULL,
	[StoreName] [varchar](50) NOT NULL,
	[Location] [varchar](50) NOT NULL,
	[ActiveInd] [tinyint] NULL,
	[CreatedDateTime] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[LastUpdatedDateTime] [datetime] NULL,
	[LastUpdatedBy] [varchar](50) NULL,
 CONSTRAINT [PK_Store] PRIMARY KEY CLUSTERED 
(
	[StoreKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[StoreSalesRepresentative](
	[StoreSalesRepresentativeKey] [int] IDENTITY(1,1) NOT NULL,
	[SalesRepresentativeKey] [int] NOT NULL,
	[StoreKey] [int] NOT NULL,
	[ActiveInd] [int] NULL,
	[CreatedDateTime] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[LastUpdatedDateTime] [datetime] NULL,
	[LastUpdatedBy] [varchar](50) NULL,
 CONSTRAINT [PK_StoreSalesRepresentative] PRIMARY KEY CLUSTERED 
(
	[StoreSalesRepresentativeKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Campaign] ADD  CONSTRAINT [DF_Campaign_ActiveInd]  DEFAULT ((1)) FOR [ActiveInd]
GO
ALTER TABLE [dbo].[Campaign] ADD  CONSTRAINT [DF_Campaign_CreatedDateTime]  DEFAULT (getdate()) FOR [CreatedDateTime]
GO
ALTER TABLE [dbo].[Campaign] ADD  CONSTRAINT [DF_Campaign_CreatedBy]  DEFAULT (suser_name()) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[Chain] ADD  CONSTRAINT [DF_Chain_ActiveInd]  DEFAULT ((1)) FOR [ActiveInd]
GO
ALTER TABLE [dbo].[Chain] ADD  CONSTRAINT [DF_Chain_CreatedDateTime]  DEFAULT (getdate()) FOR [CreatedDateTime]
GO
ALTER TABLE [dbo].[Chain] ADD  CONSTRAINT [DF_Chain_CreatedBy]  DEFAULT (suser_name()) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[MonthlySales] ADD  CONSTRAINT [DF_MonthlySales_CreatedDateTime]  DEFAULT (getdate()) FOR [CreatedDateTime]
GO
ALTER TABLE [dbo].[MonthlySales] ADD  CONSTRAINT [DF_MonthlySales_CreatedBy]  DEFAULT (suser_name()) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[SalesRepresentative] ADD  CONSTRAINT [DF_SalesRepresentative_ActiveInd]  DEFAULT ((1)) FOR [ActiveInd]
GO
ALTER TABLE [dbo].[SalesRepresentative] ADD  CONSTRAINT [DF_SalesRepresentative_CreatedDateTime]  DEFAULT (getdate()) FOR [CreatedDateTime]
GO
ALTER TABLE [dbo].[SalesRepresentative] ADD  CONSTRAINT [DF_SalesRepresentative_CreatedBy]  DEFAULT (suser_name()) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[Store] ADD  CONSTRAINT [DF_Store_ActiveInd]  DEFAULT ((1)) FOR [ActiveInd]
GO
ALTER TABLE [dbo].[Store] ADD  CONSTRAINT [DF_Store_CreatedDateTime]  DEFAULT (getdate()) FOR [CreatedDateTime]
GO
ALTER TABLE [dbo].[Store] ADD  CONSTRAINT [DF_Store_CreatedBy]  DEFAULT (suser_name()) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[StoreSalesRepresentative] ADD  CONSTRAINT [DF_StoreSalesRepresentative_ActiveInd]  DEFAULT ((1)) FOR [ActiveInd]
GO
ALTER TABLE [dbo].[StoreSalesRepresentative] ADD  CONSTRAINT [DF_StoreSalesRepresentative_CreatedDateTime]  DEFAULT (getdate()) FOR [CreatedDateTime]
GO
ALTER TABLE [dbo].[StoreSalesRepresentative] ADD  CONSTRAINT [DF_StoreSalesRepresentative_CreatedBy]  DEFAULT (suser_name()) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[MonthlySales]  WITH CHECK ADD  CONSTRAINT [FK_MonthlySales_Campaign] FOREIGN KEY([CampaignKey])
REFERENCES [dbo].[Campaign] ([CampaignKey])
GO
ALTER TABLE [dbo].[MonthlySales] CHECK CONSTRAINT [FK_MonthlySales_Campaign]
GO
ALTER TABLE [dbo].[Store]  WITH CHECK ADD  CONSTRAINT [FK_Store_Chain] FOREIGN KEY([ChainKey])
REFERENCES [dbo].[Chain] ([ChainKey])
GO
ALTER TABLE [dbo].[Store] CHECK CONSTRAINT [FK_Store_Chain]
GO
ALTER TABLE [dbo].[StoreSalesRepresentative]  WITH CHECK ADD  CONSTRAINT [FK_StoreSalesRepresentative_SalesRepresentative] FOREIGN KEY([SalesRepresentativeKey])
REFERENCES [dbo].[SalesRepresentative] ([SalesRepresentativeKey])
GO
ALTER TABLE [dbo].[StoreSalesRepresentative] CHECK CONSTRAINT [FK_StoreSalesRepresentative_SalesRepresentative]
GO
ALTER TABLE [dbo].[StoreSalesRepresentative]  WITH CHECK ADD  CONSTRAINT [FK_StoreSalesRepresentative_Store] FOREIGN KEY([StoreKey])
REFERENCES [dbo].[Store] ([StoreKey])
GO
ALTER TABLE [dbo].[StoreSalesRepresentative] CHECK CONSTRAINT [FK_StoreSalesRepresentative_Store]
GO

CREATE     PROCEDURE [dbo].[FrontPageData_SEL]
AS

DECLARE @InsertToErrorLog BIT= 1,@PrintError BIT = 0, @RaiseError BIT = 1
BEGIN TRY
	--******FRONT PAGE DATA******
	--Top Stats
	--Total Sales This Month
		SELECT SUM(SalesAmount) S FROM MonthlySales M WITH(NOLOCK) WHERE SalesMonth = MONTH(GETDATE()) AND SalesYear = YEAR(GETDATE())
	--Total Sales YTD
		SELECT SUM(SalesAmount) S FROM MonthlySales M WITH(NOLOCK) WHERE SalesYear = YEAR(GETDATE())
	--TOP Sales Store SUM
		SELECT TOP 1 SUM(SalesAmount) S, S.StoreName FROM MonthlySales M WITH(NOLOCK) 
			INNER JOIN StoreSalesRepresentative SR WITH(NOLOCK)
			ON SR.StoreSalesRepresentativeKey =  M.StoreSalesRepresentativeKey
			INNER JOIN Store S WITH(NOLOCK)
			ON S.StoreKey = SR.StoreKey
		GROUP BY S.StoreName
		ORDER BY SUM(SalesAmount) DESC
	--TOP SALES REP SUM
		SELECT TOP 1 SUM(SalesAmount) S, S.FirstName + ' ' + S.LastName RepName FROM MonthlySales M WITH(NOLOCK) 
			INNER JOIN StoreSalesRepresentative SR WITH(NOLOCK)
			ON SR.StoreSalesRepresentativeKey =  M.StoreSalesRepresentativeKey
			INNER JOIN SalesRepresentative S WITH(NOLOCK)
			ON S.SalesRepresentativeKey = SR.SalesRepresentativeKey
		GROUP BY S.FirstName + ' ' + S.LastName
		ORDER BY SUM(SalesAmount) DESC
	--Charts
	--Total Monthly Sales (line chart)
		SELECT CAST(M.SalesMonth AS VARCHAR(20)) + '/1/2000' M, SUM(SalesAmount) S 
		FROM MonthlySales M WITH(NOLOCK) 
			INNER JOIN StoreSalesRepresentative SR WITH(NOLOCK)
			ON SR.StoreSalesRepresentativeKey =  M.StoreSalesRepresentativeKey
			INNER JOIN Store S WITH(NOLOCK)
			ON S.StoreKey = SR.StoreKey
		GROUP BY M.SalesMonth
		ORDER BY M.SalesMonth
	--Total Store Sales (line chart)
		SELECT TOP 5 S.StoreKey, S.StoreName, SUM(SalesAmount) S 
		INTO #S
		FROM MonthlySales M WITH(NOLOCK) 
			INNER JOIN StoreSalesRepresentative SR WITH(NOLOCK)
			ON SR.StoreSalesRepresentativeKey =  M.StoreSalesRepresentativeKey
			INNER JOIN Store S WITH(NOLOCK)
			ON S.StoreKey = SR.StoreKey
		GROUP BY S.StoreKey, S.StoreName
		ORDER BY SUM(SalesAmount) DESC
		SELECT  CAST(M.SalesMonth AS VARCHAR(20)) + '/1/2000' M, S.StoreName, SUM(SalesAmount) S 
		FROM MonthlySales M WITH(NOLOCK) 
			INNER JOIN StoreSalesRepresentative SR WITH(NOLOCK)
			ON SR.StoreSalesRepresentativeKey =  M.StoreSalesRepresentativeKey
			INNER JOIN Store S WITH(NOLOCK)
			ON S.StoreKey = SR.StoreKey
			INNER JOIN #S TS
			ON TS.StoreKey = S.StoreKey
		GROUP BY M.SalesMonth, S.StoreName
		ORDER BY M.SalesMonth, S.StoreName
	--Total Chain Sales (donut chart)
		SELECT C.ChainName, SUM(SalesAmount) S 
		FROM MonthlySales M WITH(NOLOCK) 
			INNER JOIN StoreSalesRepresentative SR WITH(NOLOCK)
			ON SR.StoreSalesRepresentativeKey =  M.StoreSalesRepresentativeKey
			INNER JOIN Store S WITH(NOLOCK)
			ON S.StoreKey = SR.StoreKey
			INNER JOIN Chain C WITH(NOLOCK)
			ON C.ChainKey = S.ChainKey
		GROUP BY C.ChainName
	--Campaign Data (left grid)
	--Campaign, How many reps sold for each, Total Sales for each, Total % (include NULLS)
		SELECT COUNT(*) C, ISNULL(C.Description, 'NONE') Campaign, ISNULL(C.CampaignKey,0) CampaignKey, SUM(M.SalesAmount) S, ISNULL(C.Icon, 'filter_none') Icon
		INTO #T
			FROM SalesRepresentative R WITH(NOLOCK)
			INNER JOIN StoreSalesRepresentative S WITH(NOLOCK)
			ON R.SalesRepresentativeKey = S.SalesRepresentativeKey
			INNER JOIN MonthlySales M WITH(NOLOCK)
			ON S.StoreSalesRepresentativeKey = M.StoreSalesRepresentativeKey
			LEFT OUTER JOIN Campaign C WITH(NOLOCK)
			ON M.CampaignKey = C.CampaignKey
		GROUP BY ISNULL(C.Description, 'NONE'), ISNULL(C.CampaignKey,0), ISNULL(C.Icon, 'filter_none')

		SELECT T.*, C.C RepCount
		FROM #T T
		INNER JOIN 
		(
			SELECT ISNULL(M.CampaignKey,0) CampaignKey, COUNT(*) C
			FROM SalesRepresentative R WITH(NOLOCK)
			INNER JOIN StoreSalesRepresentative S WITH(NOLOCK)
			ON R.SalesRepresentativeKey = S.SalesRepresentativeKey
			INNER JOIN MonthlySales M WITH(NOLOCK)
			ON S.StoreSalesRepresentativeKey = M.StoreSalesRepresentativeKey
			GROUP BY ISNULL(M.CampaignKey,0)
		) C
		ON T.CampaignKey = C.CampaignKey
	--Timeline of campaigns
	--Campaign, dates, total sales
		SELECT COUNT(*) C, C.Description, SUM(M.SalesAmount) S, C.FromDate, C.ThruDate, ISNULL(C.Icon, 'counter_0') Icon
		FROM SalesRepresentative R WITH(NOLOCK)
		INNER JOIN StoreSalesRepresentative S WITH(NOLOCK)
		ON R.SalesRepresentativeKey = S.SalesRepresentativeKey
		INNER JOIN MonthlySales M WITH(NOLOCK)
		ON S.StoreSalesRepresentativeKey = M.StoreSalesRepresentativeKey
		INNER JOIN Campaign C WITH(NOLOCK)
		ON M.CampaignKey = C.CampaignKey
		GROUP BY C.Description, C.FromDate, C.ThruDate,ISNULL(C.Icon, 'counter_0')
		ORDER BY C.FromDate, C.ThruDate

		DROP TABLE #T

END TRY

  BEGIN CATCH
           DECLARE @ErrorNumber INT,  @ErrorSeverity INT,
                   @ErrorState INT,  @ErrorProcedure VARCHAR(200),
                   @ErrorLine INT,@ErrorMessage VARCHAR(4000), @Xactstate INT
          SELECT   @ErrorNumber =ERROR_NUMBER(),
                   @ErrorSeverity =ERROR_SEVERITY(),
                   @ErrorState =ERROR_STATE(),
                   @ErrorProcedure = isnull(ERROR_PROCEDURE(),'-'),
                   @ErrorLine =ERROR_LINE(),
                   @ErrorMessage =ERROR_MESSAGE(),
                   @Xactstate=XACT_STATE()
          IF @PrintError = 1
                BEGIN
                      PRINT ' Error ' + CONVERT(VARCHAR(50), @errornumber)
                      PRINT ' Severity ' + CONVERT(VARCHAR(5), @ErrorSeverity)
                      PRINT ' State ' + CONVERT(VARCHAR(5), @ErrorState)
                      PRINT ' Line ' + CONVERT(VARCHAR(5), @ErrorLine)
                      PRINT ' Procedure ' + CONVERT(VARCHAR(5), @ErrorProcedure)
                      PRINT @Errormessage;
                END
          IF @RaiseError = 1
             SET @Errormessage  = @Errormessage + ' Severity %d, Status %d, Line %d, Procedure %s';
                  RAISERROR (@ErrorMessage, @ErrorSeverity,
                                   1,@ErrorNumber,@ErrorSeverity,@ErrorState,@ErrorProcedure,@ErrorLine);
END CATCH
GO
