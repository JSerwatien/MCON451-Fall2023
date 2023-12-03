using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MCON451.Entity
{
    public class MonthlySalesFormEntity
    {
        public int StoreSalesRepresentativeKey { get; set; } 
        public int SalesMonth { get; set; }
        public int SalesYear { get; set; }
        public decimal SalesAmount { get; set; }
        public int CampaignKey { get; set; }
        public List<StringIntDoubleEntity> ListOfReps { get; set; }
        public List<StringIntDoubleEntity> ListOfCampaigns { get; set; }
        public Exception ErrorObject { get; set; }
        public string PageMessage { get; set; }
    }
}
