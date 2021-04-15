using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Logging;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Toboggan.DataAccess;
using Toboggan.Models;

namespace Toboggan.Controllers
{
    [Route("api/Shop")]
    [ApiController]
    public class ShopController : ControllerBase
    {
        ShopRepository _repo;

        public ShopController()
        {
            _repo = new ShopRepository();
        }

        [HttpGet]
        public IActionResult GetAllShops()
        {
            return Ok(_repo.GetAll());
        }

        [HttpGet("{id}")]
        public IActionResult GetShop(int id)
        {
            var shop = _repo.Get(id);
            if (shop == null)
            {
                return NotFound("This shop does not exist");
            }
            return Ok(shop);
        }

        [HttpPost]
        public IActionResult AddNewShop(Shop shop)
        {
            _repo.Add(shop);
            return Created($"api/Shop", shop);
        }

        [HttpPut("{id}")]
        public IActionResult UpdateShop(Shop shop)
        {
            _repo.Update(shop);
            return Ok();
        }

        [HttpDelete("{id}")]
        public IActionResult DeleteShop(int id)
        {
            _repo.Delete(id);
            return Ok();
        }
    }
}
