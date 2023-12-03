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
        public  static MonthlySalesFormEntity GetFormData()
        {
            string strSQL = "EXEC dbo.MonthlySalesForm_GetData";
            DataSet ds = new();
            MonthlySalesFormEntity returnData = new();
            try
            {
                ds = DataFactory.GetDataSet(strSQL, "FormData");
                returnData.ListOfReps = LoadListOfReps(ds.Tables[0]);
                returnData.ListOfCampaigns = LoadCampaigns(ds.Tables[1]);
            }
            catch (Exception ex)
            {
                returnData.ErrorObject=ex;
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
    }
}
