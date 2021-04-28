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
    public class OrderController : FirebaseEnabledController
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

        [HttpGet("User/{id}")]
        public IActionResult GetSingleOrderById(int id)
        {
            var order = _repo.GetOrderByUserId(id);

            if (order == null)
            {
                return NotFound("This order does not exist.");
            }

            return Ok(order);
        }

        [HttpGet("SellerOrder/{id}")]
        public IActionResult GetOrderByUserId(int id)
        {
            var orders = _repo.SellerOrdersById(id);

            if (orders == null)
            {
                return NotFound("This order does not exist.");
            }

            return Ok(orders);
        }

        [HttpGet("orderLineItems/{id}")]
        public IActionResult GetOrderAndLineItemsByUserId(int id)
        {
            var orders = _repo.GetOrderAndLineItemsByUserId(id);

            if (orders == null)
            {
                return NotFound("This order does not exist.");
            }

            return Ok(orders);
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
