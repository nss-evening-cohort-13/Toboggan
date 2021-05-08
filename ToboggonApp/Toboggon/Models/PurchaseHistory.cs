using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Toboggan.Models
{
    public class PurchaseHistory
    {
        public int OrderTableId { get; set; }
        public int ShopId { get; set; } 
        public string ShopName { get; set; }
        public double TotalCost { get; set; }
        public DateTime SaleDate { get; set; } 
        public string CategoryName { get; set; }
        public string Title { get; set; }
        public string Description { get; set; } 
        public double Price { get; set; } 
        public int QuantityBought { get; set; } 

    }
}
