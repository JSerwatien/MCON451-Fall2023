using MCON451.Entity;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MCON451.Data.Code
{
    public class FrontPageFactory
    {
        public static FrontPageDataEntity LoadFrontPageData ()
        {
            FrontPageDataEntity returnData = new();
            string strSQL = "EXEC FrontPageData_SEL";
            DataSet ds = new();
            try
            {
                ds = DataFactory.GetDataSet(strSQL, "FrontPageData");

                returnData.TotalSalesThisMonth = Convert.ToDecimal(ds.Tables[0].Rows[0]["S"]);
                returnData.TotalSalesYTD = Convert.ToDecimal(ds.Tables[1].Rows[0]["S"]);
                returnData.StoreTotal = new(){ DecimalValue = Convert.ToDecimal(ds.Tables[2].Rows[0]["S"]), StringValue= ds.Tables[2].Rows[0]["StoreName"].ToString() };
                returnData.RepTotal = new(){ DecimalValue = Convert.ToDecimal(ds.Tables[3].Rows[0]["S"]), StringValue= ds.Tables[3].Rows[0]["RepName"].ToString() };
                returnData.MonthlySales = LoadStringIntDoubleDateEntityList(ds.Tables[4], string.Empty, "S", string.Empty, "M"); 
                returnData.MonthlySalesByStore   = LoadStringIntDoubleDateEntityList(ds.Tables[5], "StoreName", "S", string.Empty, "M"); 
                returnData.SalesByChain = LoadStringIntDoubleEntityList(ds.Tables[6], "ChainName", "S", string.Empty); 
                returnData.CampaignSummaryList = LoadCampaignSummaryList(ds.Tables[7]);
                returnData.CampaignTimeline = LoadCampaignTimeline(ds.Tables[8]);
                //returnData.PageMessage = "Your data was loaded successfully!";
                //returnData.ErrorObject = new Exception("There was some kind of error");
            }
            catch (Exception ex)
            {
                returnData.ErrorObject=ex;
            }
            return returnData;
        }

        private static List<CampaignTimelineEntity> LoadCampaignTimeline(DataTable dataTable)
        {
            List<CampaignTimelineEntity> returnData = new();

            foreach(DataRow newRow in dataTable.Rows)
            {
                CampaignTimelineEntity newItem = new();
                newItem.FromDate = Convert.ToDateTime(newRow["FromDate"]);
                newItem.ThruDate = Convert.ToDateTime(newRow["ThruDate"]);
                newItem.Description = newRow["Description"].ToString();
                newItem.Icon = newRow["Icon"].ToString();
                newItem.TheCount = Convert.ToInt32(newRow["C"]);
                newItem.TheSum = Convert.ToDecimal(newRow["S"]);
                returnData.Add(newItem);
            }
            return returnData;
        }

        private static List<CampaignSummaryEntity> LoadCampaignSummaryList(DataTable dataTable)
        {
            List<CampaignSummaryEntity> returnData = new();

            decimal totalSales = Convert.ToDecimal(dataTable.Compute("SUM(S)", string.Empty));

            foreach (DataRow newRow in dataTable.Rows)
            {
                CampaignSummaryEntity newItem = new();
                newItem.TheSum = Convert.ToDecimal(newRow["S"]);
                newItem.TheCount = Convert.ToInt32(newRow["C"]);
                newItem.RepCount = Convert.ToInt32(newRow["RepCount"]);
                newItem.CampaignKey = Convert.ToInt32(newRow["CampaignKey"]);
                newItem.Campaign = newRow["Campaign"].ToString();
                newItem.Icon = newRow["Icon"].ToString();
                newItem.TotalPercentage = Convert.ToInt32((newItem.TheSum / totalSales)*100);
                returnData.Add(newItem);
            }
            return returnData;
        }

        private static List<StringIntDoubleEntity> LoadStringIntDoubleEntityList(DataTable dataTable, string stringValueField, string decimalValueField, string intValueField)
        {
            List<StringIntDoubleEntity> returnData = new();
            foreach (DataRow newRow in dataTable.Rows)
            {
                StringIntDoubleEntity newItem = new();
                if (!string.IsNullOrEmpty(stringValueField)) { newItem.StringValue = newRow[stringValueField].ToString(); }
                if (!string.IsNullOrEmpty(decimalValueField)) { newItem.DecimalValue = Convert.ToDecimal(newRow[decimalValueField]); }
                if (!string.IsNullOrEmpty(intValueField)) { newItem.IntValue = Convert.ToInt32(newRow[intValueField]); }
                returnData.Add(newItem);
            }
            return returnData;
        }
        private static List<StringIntDoubleDateEntity> LoadStringIntDoubleDateEntityList(DataTable dataTable, string stringValueField, string decimalValueField, string intValueField, string dateValueField)
        {
            List<StringIntDoubleDateEntity> returnData = new();
            foreach (DataRow newRow in dataTable.Rows)
            {
                StringIntDoubleDateEntity newItem = new();
                if (!string.IsNullOrEmpty(stringValueField)) { newItem.StringValue = newRow[stringValueField].ToString(); }
                if (!string.IsNullOrEmpty(decimalValueField)) { newItem.DecimalValue = Convert.ToDecimal(newRow[decimalValueField]); }
                if (!string.IsNullOrEmpty(intValueField)) { newItem.IntValue = Convert.ToInt32(newRow[intValueField]); }
                if (!string.IsNullOrEmpty(dateValueField)) { newItem.DateValue= Convert.ToDateTime(newRow[dateValueField]); }
                returnData.Add(newItem);
            }
            return returnData;
        }
    }
}
