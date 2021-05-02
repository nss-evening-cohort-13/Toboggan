using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Toboggan.Models
{
    public class SellerOrders
    {
        public int OrderTableId { get; set; }
        public int ShopId { get; set; } //ShopId
        public string FirstName { get; set; } //Buyer FirstName
        public string LastName { get; set; } //Buyer LastName
        public string ShopName { get; set; }
        public double TotalCost { get; set; }
        public DateTime SaleDate { get; set; } //Date Sold
        public string Name { get; set; } //Category Name
        public string Title { get; set; } //Product Title
        public string Description { get; set; } //Product Description
        public double Price { get; set; } //Product Price
        public int QuantityBought { get; set; } //Order Line Item Quantity
        public int QuantityLeft { get; set; } //Products Left in Inventory

        public bool Completed { get; set; }

    }
}
