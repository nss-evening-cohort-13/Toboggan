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

        [HttpGet("{id}")]
        public IActionResult Get(int id)
        {
            var category = _repo.Get(id);

            if (category == null) { return NotFound("This Category Does not Exist"); }

            return Ok(category);
        }

    }
}
