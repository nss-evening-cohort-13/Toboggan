using Toboggan.DataAccess;
using Toboggan.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Toboggan.Controllers
{
    [Route("api/OrderLineItem")]
    [ApiController]
    public class OrderLineItemController : ControllerBase
    {
        OrderLineItemRepository _repo;
        public OrderLineItemController()
        {
            _repo = new OrderLineItemRepository();
        }

        [HttpGet]
        public IActionResult GetAllOrderLineItems()
        {
            return Ok(_repo.GetAll());
        }

        [HttpGet("{id}")]
        public IActionResult GetById(int id)
        {
            var orderLineItem = _repo.Get(id);
            if (orderLineItem == null)
            {
                return NotFound("This order line item id does not exist.");
            }

            return Ok(orderLineItem);
        }

        [HttpPost]
        public IActionResult AddOrderLineItem(OrderLineItem orderLI)
        {
            _repo.AddOrderLineItem(orderLI);
            return Created($"api/OrderLineItem/{orderLI.Id}", orderLI);
        }
    }
}
