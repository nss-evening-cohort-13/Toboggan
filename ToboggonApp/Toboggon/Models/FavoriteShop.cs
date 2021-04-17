using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Toboggan.Models
{
    public class FavoriteShop
    {
            public int Id { get; set; }
            public int ShopId { get; set; }
            public int UserId { get; set; }
    }
}
