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
        public IActionResult GetSingleOrderById(string id)
        {
            var order = _repo.GetOrderByUserId(id);

            if (order == null)
            {
                return NotFound("This order does not exist.");
            }

            return Ok(order);
        }

        [HttpGet("SellerOrder/{id}")]
        public IActionResult GetOrderByUserId(string id)
        {
            var orders = _repo.SellerOrdersById(id);

            if (orders == null)
            {
                return NotFound("This order does not exist.");
            }

            return Ok(orders);
        }

        [HttpGet("SellerOrderToBeShipped/{id}")]
        public IActionResult GetOrdersToBeShippedByUserId(string id)
        {
            var resultList = _repo.SellerOrdersById(id);

            var orders = resultList.Where(o => !o.Completed);

            if (orders == null)
            {
                return NotFound("This order does not exist.");
            }

            return Ok(orders);
        }

        /* Gives total by id of the seller */
        [HttpGet("SellerTotalandAvgPrice/{id}")]
        public IActionResult totalSalesAvgperSeller(string id)
        {
            var sales = _repo.totalSalesAvgperSeller(id);

            return Ok(sales);
        }

        // Gives Total Sales By Data

        [HttpGet("totalSalesByDate/{id}")]
            public IActionResult totalSalesByDate(string id)
        {
            var sales = _repo.totalSalesByDate(id);
            return Ok(sales);
        }

        [HttpGet("orderLineItems/{id}")]
        public IActionResult GetOrderAndLineItemsByUserId(string id)
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
