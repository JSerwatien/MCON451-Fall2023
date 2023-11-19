using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MCON451.Entity
{
    public class CampaignSummaryEntity
    {
        public int TheCount { get; set; }    
        public string Campaign { get; set; }
        public int CampaignKey { get; set; }
        public decimal TheSum { get; set; }
        public int RepCount { get; set; }
        public int TotalPercentage { get; set; }
        public string Icon { get; set; }
    }
}
