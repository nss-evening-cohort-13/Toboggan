using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Toboggan.Models
{
    public class PurchaseHistory
    {
        public int OrderTableId { get; set; }
        public int ShopId { get; set; } //ShopId
        public string ShopName { get; set; }
        public double TotalCost { get; set; }
        public DateTime SaleDate { get; set; } //Date Sold
        public string CategoryName { get; set; } //Category Name
        public string Title { get; set; } //Product Title
        public string Description { get; set; } //Product Description
        public double Price { get; set; } //Product Price
        public int QuantityBought { get; set; } //Order Line Item Quantity

    }
}
