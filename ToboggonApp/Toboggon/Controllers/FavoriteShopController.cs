using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Toboggan.DataAccess;
using Toboggan.Models;

namespace Toboggan.Controllers
{
    [ApiController]
    [Route("api/FavoriteShop")]
    public class FavoriteShopController : FirebaseEnabledController
    {
        FavoriteShopRepository _repo;

        public FavoriteShopController()
        {
            _repo = new FavoriteShopRepository();
        }

        [HttpGet]
        public IActionResult GetAllFavoriteShops()
        {
            return Ok(_repo.GetAllFavoriteShops());
        }

        [HttpGet("{id}")]
        public IActionResult GetFavoriteShop(int id)
        {
            var shop = _repo.GetSingleFavoriteShop(id);
            if (shop == null)
            {
                return NotFound("This shop does not exist");
            }
            return Ok(shop);
        }

        [HttpPost]
        public IActionResult AddNewFavoriteShop(FavoriteShop shop)
        {
            _repo.AddAFavoriteShop(shop);
            return Created($"api/FavoriteShop/{shop.Id}", shop);
        }

        [HttpPatch]
        public IActionResult UpdateFavoriteShop(FavoriteShop shop)
        {
            _repo.UpdateFavoriteShop(shop);
            return Ok();
        }

        [HttpDelete("{id}")]
        public IActionResult DeleteFavoriteShop(int id)
        {
            _repo.DeleteFavoriteShop(id);
            return Ok();
        }

        [HttpDelete("byShopId/{id}")]
        public IActionResult DeleteFavoriteShopByShopId(int shopId)
        {
            _repo.DeleteFavoriteShopByShopId(shopId);
            return Ok();
        }

    }
}
