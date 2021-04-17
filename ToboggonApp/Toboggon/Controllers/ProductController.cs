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

        // GET to / api/products
        [HttpGet]
        public IActionResult GetAllProducts()
        {
            return Ok(_repo.GetAll());
        }

        //GET /api/products/id
        [HttpGet("{id}")]
        public IActionResult GetProductById(int id)
        {
            var product = _repo.Get(id);

            if (product == null)
            {
                return NotFound("This product does not exist");
            }
            return Ok(product);
        }
    }
}
