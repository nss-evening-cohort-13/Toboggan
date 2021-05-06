using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Toboggan.Models
{
    public class Shop
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string UserId { get; set; }
        public DateTime CreatedDate { get; set; }
        public string ShopImage { get; set; }
        public string Description { get; set; }
    }
}
