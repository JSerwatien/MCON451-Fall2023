using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MCON451.Entity
{
    public class MonthlySalesEntity
    {
        public int MonthlySalesKey { get; set; }
        public int StoreSalesRepresentativeKey { get; set; }
        public int SalesMonth { get; set; }
        public int SalesYear { get; set; }
        public decimal SalesAmount { get; set; }
        public int CampaignKey { get; set; }
        public string SalesRepName { get; set; }
        public string CampaignName { get; set; }
        public string StoreName { get; set; }
        public Exception ErrorObject { get; set; }
        public string CreatedBy { get; set; }
        public string LastUpdatedBy { get; set; }
        public DateTime CreatedDateTime { get; set; }
        public DateTime LastUpdatedDateTime { get; set; }
    }
}
