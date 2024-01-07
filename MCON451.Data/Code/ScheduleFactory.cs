using MCON451.Entity;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MCON451.Data.Code
{
    public class ScheduleFactory
    {
        public static List<StringIntDoubleDateEntity> GetScheduleData(UserEntity currentUser)
        {
            List<StringIntDoubleDateEntity> returnData = new();
            Random newRandom = new();
            string strSQL = "EXEC dbo.Schedule_GetData";
            DataSet ds = new();
            try
            {
                ds = DataFactory.GetDataSet(strSQL, "ScheduleData");
                foreach(DataRow newRow in ds.Tables[0].Rows)
                {
                    StringIntDoubleDateEntity newItem = new();
                    newItem.IntValue = Convert.ToInt32(newRow["MonthlySalesKey"]);
                    newItem.DateValue = Convert.ToDateTime(newRow["SalesMonth"] +"/" + newRandom.Next(1,28) + "/" + newRow["SalesYear"]);
                    newItem.StringValue = newRow["FirstName"] + " " + newRow["LastName"] + " generated " +
                            Convert.ToDecimal(newRow["SalesAmount"]).ToString("c") + " in sales for " + newRow["StoreName"] + " (" +
                            newRow["Campaign"] + ")";
                    returnData.Add(newItem);
                }
                return returnData;
            }
            catch (System.Exception ex)
            {
                throw ex;
            }
        }
    }
}
