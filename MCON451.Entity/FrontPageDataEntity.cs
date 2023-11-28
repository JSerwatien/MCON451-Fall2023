namespace MCON451.Entity
{
    public class FrontPageDataEntity
    {

        //Total Sales This Month
        public decimal TotalSalesThisMonth { get; set; }
        //Total Sales YTD
        public decimal TotalSalesYTD { get; set; }
        //TOP Sales Store SUM
        public StringIntDoubleEntity StoreTotal { get; set; }
        //TOP SALES REP SUM
        public StringIntDoubleEntity RepTotal { get; set; }
        //Total Monthly Sales (line chart)
        public List<StringIntDoubleDateEntity> MonthlySales { get; set; }
        //Total Store Sales (line chart)
        public List<StringIntDoubleDateEntity> MonthlySalesByStore { get; set; }
        //Total Chain Sales (donut chart)
        public List<StringIntDoubleEntity> SalesByChain { get; set; }
        //Campaign, How many reps sold for each, Total Sales for each, Total % (include NULLS)
        public List<CampaignSummaryEntity> CampaignSummaryList { get; set; }
        //Campaign, dates, total sales
        public List<CampaignTimelineEntity> CampaignTimeline { get; set; }
        public Exception ErrorObject { get; set; }
        public string PageMessage { get; set; }
    }
}