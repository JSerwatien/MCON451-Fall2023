using MCON451.Entity;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MCON451.Data.Code
{
    public class MonthlySalesFormFactory
    {
        public  static MonthlySalesFormEntity GetFormData(int monthlySalesKey)
        {
            string strSQL = "EXEC dbo.MonthlySalesForm_GetData ";
            DataSet ds = new();
            MonthlySalesFormEntity returnData = new();
            try
            {
                if(monthlySalesKey>0) { strSQL += monthlySalesKey; }
                ds = DataFactory.GetDataSet(strSQL, "FormData");
                returnData.ListOfReps = LoadListOfReps(ds.Tables[0]);
                returnData.ListOfCampaigns = LoadCampaigns(ds.Tables[1]);
                returnData = LoadRecordData(returnData, ds.Tables[2]);
            }
            catch (Exception ex)
            {
                returnData.ErrorObject=ex;
            }
            return returnData;
        }

        private static MonthlySalesFormEntity LoadRecordData(MonthlySalesFormEntity returnData, DataTable dataTable)
        {
            if(dataTable!= null && dataTable.Rows.Count==1)
            {
                returnData.SalesMonth = Convert.ToInt16(dataTable.Rows[0]["SalesMonth"]);
                returnData.SalesYear = Convert.ToInt16(dataTable.Rows[0]["SalesYear"]);
                returnData.MonthlySalesKey = Convert.ToInt32(dataTable.Rows[0]["MonthlySalesKey"]);
                returnData.StoreSalesRepresentativeKey = Convert.ToInt32(dataTable.Rows[0]["StoreSalesRepresentativeKey"]);
                returnData.CampaignKey = Convert.ToInt32(dataTable.Rows[0]["CampaignKey"]);
                returnData.SalesAmount = Convert.ToDecimal(dataTable.Rows[0]["SalesAmount"]);
            }
            return returnData;
        }

        private static List<StringIntDoubleEntity> LoadCampaigns(DataTable dataTable)
        {
            List<StringIntDoubleEntity> returnData = new();
            foreach (DataRow newRow in dataTable.Rows)
            {
                StringIntDoubleEntity newItem = new();
                newItem.StringValue = newRow["Description"] + " (" + newRow["CampaignCode"] + ")";
                newItem.IntValue = Convert.ToInt32(newRow["CampaignKey"]);
                returnData.Add(newItem);
            }
            return returnData;
        }

        private static List<StringIntDoubleEntity> LoadListOfReps(DataTable dataTable)
        {
            List<StringIntDoubleEntity> returnData = new();
            foreach(DataRow newRow in dataTable.Rows)
            {
                StringIntDoubleEntity newItem = new();
                newItem.StringValue = newRow["FirstName"] + " " + newRow["LastName"] + " - " + newRow["StoreName"] + " (" + newRow["Location"] + ")";
                newItem.IntValue = Convert.ToInt32(newRow["StoreSalesRepresentativeKey"]);
                returnData.Add(newItem);
            }
            return returnData;
        }
        public static MonthlySalesFormEntity SaveMonthlySales(MonthlySalesFormEntity theSales)
        {
            string strSQL = "EXEC dbo.MonthlySalesForm_InsUpt {0},{1},{2},{3},{4},{5}";
            DataSet ds = new();
            try
            {
                strSQL = string.Format(strSQL, theSales.MonthlySalesKey, theSales.StoreSalesRepresentativeKey, 
                            theSales.SalesMonth, theSales.SalesYear, theSales.CampaignKey >0 ? theSales.CampaignKey : "NULL", 
                            theSales.SalesAmount);
                ds = DataFactory.GetDataSet(strSQL, "SavedSales");
                theSales.MonthlySalesKey = Convert.ToInt32(ds.Tables[0].Rows[0][0]);
                theSales.PageMessage = "Your sales amount was saved successfully with ID " + theSales.MonthlySalesKey +"!";
            }
            catch (Exception ex)
            {
                theSales.ErrorObject = ex;
            }
            return theSales;
        }
        public static MonthlySalesReportEntity GetReportData(int numberOfDays)
        {
            DataSet ds = new();
            MonthlySalesReportEntity returnData = new();
            string strSQL = "EXEC dbo.MonthlySalesReport_GetData " + numberOfDays;
            try
            {
                ds = DataFactory.GetDataSet(strSQL, "ReportData");
                returnData.SalesData = LoadSalesData(ds.Tables[0]);
            }
            catch (Exception ex)
            {
                returnData.ErrorObject = ex;
            }
            return returnData;
        }

        private static List<MonthlySalesEntity> LoadSalesData(DataTable dataTable)
        {
            List<MonthlySalesEntity> returnData = new();
            foreach(DataRow newRow in dataTable.Rows)
            {
                MonthlySalesEntity newItem = new();
                try
                {
                    newItem.SalesMonth = Convert.ToInt16(newRow["SalesMonth"]);
                    newItem.SalesYear = Convert.ToInt16(newRow["SalesYear"]);
                    newItem.MonthlySalesKey = Convert.ToInt32(newRow["MonthlySalesKey"]);
                    newItem.StoreSalesRepresentativeKey = Convert.ToInt32(newRow["StoreSalesRepresentativeKey"]);
                    newItem.CampaignKey = Convert.ToInt32(newRow["CampaignKey"]);
                    newItem.SalesAmount = Convert.ToDecimal(newRow["SalesAmount"]);
                    newItem.StoreName = newRow["StoreName"].ToString();
                    newItem.CampaignName = newRow["Campaign"].ToString();
                    newItem.SalesRepName = newRow["FirstName"].ToString() + " " + newRow["LastName"].ToString();
                }
                catch (Exception ex)
                {
                    newItem.ErrorObject = ex;
                }
                returnData.Add(newItem);
            }
            return returnData;
        }
    }
}
