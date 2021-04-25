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
    [Route("api/Categories")]
    [ApiController]
    public class CategoriesController : ControllerBase
    {
        CategoriesRepository _repo;
        public CategoriesController()
        {
            _repo = new CategoriesRepository();
        }

        [HttpGet]
        public IActionResult GetAllCategories()
        {
            return Ok(_repo.GetAll());
        }

        [HttpGet("ProductQuantity")]
        public IActionResult GetQuantityOfProductsPerCategory()
        {
            return Ok(_repo.GetQuantityOfProductsPerCategory());
        }


        [HttpGet("ThreeNewestProducts")]
        public IActionResult GetThreeNewestProducts()
        {
            return Ok(_repo.GetThreeNewestProducts());
        }

        [HttpGet("{id}")]
        public IActionResult GetSingleCategory(int id)
        {
            var category = _repo.GetSingleCategory(id);

            if (category == null) { return NotFound("This Category Does not Exist"); }

            return Ok(category);
        }

        [HttpPost]
        public IActionResult AddACategory(Category category)
        {
            _repo.AddACategory(category);
            return Created($"api/Category/{category.Id}", category);
        }

        [HttpPatch]
        public IActionResult UpdateCategory(Category category)
        {
            _repo.UpdateCategory(category);
            return NoContent();
        }

        [HttpDelete("{id}")]
        public IActionResult DeleteCategory(int id)
        {
            _repo.DeleteCategory(id);
            return Ok();
        }
    }
}
