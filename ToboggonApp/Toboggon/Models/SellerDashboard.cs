using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Toboggan.Models
{
    public class SellerDashboard
    {
        public double totQuantity { get; set; }
        public double total { get; set; }
    }

    public class SalesByDate
    {
        public double total { get; set; }
        public int year { get; set; }
        public int quarter { get; set; }
        public int Month { get; set; }
        public int day { get; set; }
    }

}
