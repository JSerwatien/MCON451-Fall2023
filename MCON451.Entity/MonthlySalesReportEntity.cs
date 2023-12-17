using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MCON451.Entity
{
    public class MonthlySalesReportEntity
    {
        public Exception ErrorObject { get; set; }
        public string PageMessage { get; set; }
        public List<MonthlySalesEntity> SalesData { get; set; }
    }
}
