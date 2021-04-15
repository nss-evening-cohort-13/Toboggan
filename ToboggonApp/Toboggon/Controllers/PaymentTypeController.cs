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
    [Route("api/PaymentType")]
    [ApiController]
    public class PaymentTypeController : ControllerBase
    {
        PaymentTypeRepository _repo;
        public PaymentTypeController()
        {
            _repo = new PaymentTypeRepository();
        }

        //GET to /api/PaymentType
        [HttpGet]
        public IActionResult GetAllPaymentTypes()
        {
            return Ok(_repo.GetAll());
        }

        //GET to /api/PaymentType/{id}
        [HttpGet("{id")]
        public IActionResult GetById(int id)
        {
            var paymentType = _repo.Get(id);

            if (paymentType == null)
            {
                return NotFound("This PaymentType id does not exist");
            }

            return Ok(paymentType);
        }
    }
}
