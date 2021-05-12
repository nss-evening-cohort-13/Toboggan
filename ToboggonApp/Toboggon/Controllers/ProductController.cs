using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Toboggan.Models;
using Toboggan.DataAccess;
using Microsoft.AspNetCore.Authorization;

namespace Toboggan.Controllers
{
    [Route("api/Products")]
    [ApiController]
    [Authorize]

    public class ProductsController : FirebaseEnabledController
    {
        ProductsRepository _repo;
        public ProductsController()
        {
            _repo = new ProductsRepository();
        }

        [HttpGet]
        [AllowAnonymous]
        public IActionResult GetAllProducts()
        {
            return Ok(_repo.GetAll());
        }

        [HttpGet("singleShop/{shopId}")]
        [AllowAnonymous]
        public IActionResult GetProductsOfAShop(int shopId)
        {
            var productList = _repo.GetProductsOfAShop(shopId);

            if (productList == null)
            {
                return NotFound("This product does not exist");
            }

            return Ok(productList);
        }


        [HttpGet("{id}")]
        public IActionResult GetProductById(int id)
        {
            var product = _repo.GetSingleProduct(id);

            if (product == null)
            {
                return NotFound("This product does not exist");
            }
            return Ok(product);
        }

        [HttpPost]
        [AllowAnonymous]
        public IActionResult AddAProduct(Product product)
        {
            _repo.AddAProduct(product);
            return Created($"api/Products/{product.Id}", product);
        }

        [HttpPatch]
        [AllowAnonymous]
        public IActionResult UpdateProduct(Product product)
        {
            _repo.UpdateProduct(product);
            return NoContent();
        }

    }
}
