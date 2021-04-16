using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Toboggan.Models
{
    public class Order
    {
        public int Id { get; set; }
        public int UserId { get; set; }
        public double TotalCost { get; set; }
        public int PaymentTypeId { get; set; }
        public DateTime SaleDate { get; set; }
        public int OrderLineItemId { get; set; }
    }
}
