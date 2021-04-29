using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Toboggan.DataAccess;
using Toboggan.Models;

namespace Toboggan.Controllers
{
    [Route("api/Users")]
    [ApiController]
    public class UserController : FirebaseEnabledController
    {
        UserRepository _repo;

        public UserController()
        {
            _repo = new UserRepository();
        }

        [HttpGet]
        public IActionResult GetAllUsers()
        {
            return Ok(_repo.GetAll());
        }

        [HttpGet("{id}")]
        public IActionResult GetSingleUserById(int id)
        {
            var user = _repo.GetSingleUser(id);

            if(user == null)
            {
                return NotFound("This user does not exist.");
            }

            return Ok(user);
        }

        [HttpGet("seller-search")]
        public IActionResult GetSellers()
        {
            return Ok(_repo.GetSellers());


        }

        [HttpPost]
        public IActionResult AddAUser(User user)
        {
            _repo.AddAUser(user);
            return Created($"api/Users/{user.Id}", user);
        }

        [HttpPatch]
        public IActionResult UpdateUser(User user)
        {
            _repo.UpdateUser(user);

            return NoContent();
        }

        [HttpDelete("{id}")]
        public IActionResult DeleteUser(int id)
        {
            _repo.DeleteUser(id);

            return Ok();
        }
    }
}
