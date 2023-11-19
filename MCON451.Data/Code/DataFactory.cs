using Microsoft.Data.SqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MCON451.Data.Code
{
    public class DataFactory
    {
        private static readonly string connectionString = "Data Source=localhost\\SQLExpress;Initial Catalog =MCON451; Integrated Security = True;TrustServerCertificate=True";
        public static DataSet GetDataSet(string strSQL, string tableName)
        {
            try
            {
                DataSet ds = new DataSet();
                SqlDataAdapter sqlAdapter = new SqlDataAdapter(strSQL, connectionString);
                sqlAdapter.Fill(ds, tableName);
                return ds;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
