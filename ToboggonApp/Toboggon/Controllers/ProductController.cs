using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Toboggan.Models;
using Toboggan.DataAccess;

namespace Toboggan.Controllers
{
    [Route("api/Products")]
    [ApiController]
    public class ProductsController : ControllerBase
    {
        ProductsRepository _repo;
        public ProductsController()
        {
            _repo = new ProductsRepository();
        }

        [HttpGet]
        public IActionResult GetAllProducts()
        {
            return Ok(_repo.GetAll());
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
        public IActionResult AddAProduct(Product product)
        {
            _repo.AddAProduct(product);
            return Created($"api/Products/{product.Id}", product);
        }

        [HttpPatch]
        public IActionResult UpdateProduct(Product product)
        {
            _repo.UpdateProduct(product);
            return NoContent();
        }

        [HttpDelete("{id}")]
        public IActionResult DeleteProduct(int id)
        {
            _repo.DeleteProduct(id);
            return Ok();
        }

    }
}
