using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Toboggan.Models
{
    public class Order
    {
        public int Id { get; set; }
        public string UserId { get; set; }
        public double TotalCost { get; set; }
        public int PaymentTypeId { get; set; }
        public DateTime SaleDate { get; set; }
        public bool Completed { get; set; }
        public List<OrderLineItem> orderLineItems { get; set; } = new List<OrderLineItem>();
    }
}
