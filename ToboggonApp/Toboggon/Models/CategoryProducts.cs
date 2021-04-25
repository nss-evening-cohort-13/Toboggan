using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Toboggan.Models
{
    public class CategoryProducts
    {
        public int CategoryId { get; set; }
        public string Name { get; set; }
        public int Quantity { get; set; }
        public List<Product> Products { get; set; } = new List<Product>();
    }
}
