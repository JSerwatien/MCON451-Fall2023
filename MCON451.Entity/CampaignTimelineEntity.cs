using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MCON451.Entity
{
    public class CampaignTimelineEntity
    {
        public int TheCount { get; set; } 
        public string Description { get; set; }
        public decimal TheSum { get; set; }
        public DateTime FromDate { get; set; }
        public DateTime ThruDate { get; set; }
        public string Icon { get; set; }
    }
}
