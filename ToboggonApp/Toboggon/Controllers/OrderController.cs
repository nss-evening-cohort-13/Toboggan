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
    [Route("api/Orders")]
    [ApiController]
    public class OrderController : ControllerBase
    {
        OrderRepository _repo;

        public OrderController()
        {
            _repo = new OrderRepository();
        }

        [HttpGet]
        public IActionResult GetAllOrders()
        {
            return Ok(_repo.GetAll());
        }

        [HttpGet("{id}")]
        public IActionResult GetSingleOrderById(int id)
        {
            var user = _repo.GetSingleOrder(id);

            if (user == null)
            {
                return NotFound("This order does not exist.");
            }

            return Ok(user);
        }

        [HttpPost]
        public IActionResult AddAnOrder(Order order)
        {
            _repo.AddAnOrder(order);
            return Created($"api/Users/{order.Id}", order);
        }

        [HttpPatch]
        public IActionResult UpdateUser(Order order)
        {
            _repo.UpdateOrder(order);

            return NoContent();
        }

        [HttpDelete("{id}")]
        public IActionResult DeleteUser(int id)
        {
            _repo.DeleteOrder(id);

            return Ok();
        }
    }
}
