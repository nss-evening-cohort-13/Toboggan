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
    public class PaymentTypeController : FirebaseEnabledController
    {
        PaymentTypeRepository _repo;
        public PaymentTypeController()
        {
            _repo = new PaymentTypeRepository();
        }

        [HttpGet]
        public IActionResult GetAllPaymentTypes()
        {
            return Ok(_repo.GetAll());
        }

        [HttpGet("{id}")]
        public IActionResult GetById(int id)
        {
            var paymentType = _repo.Get(id);

            if (paymentType == null)
            {
                return NotFound("This PaymentType id does not exist");
            }

            return Ok(paymentType);
        }

        [HttpGet("getbyUserId/{userId}")]
        public IActionResult GetByUserId(string userId)
        {
            var paymentType = _repo.GetByUserId(userId);

            if (paymentType == null)
            {
                return NotFound("This PaymentType id does not exist");
            }

            return Ok(paymentType);
        }

        [HttpPost]
        public IActionResult AddPaymentType(PaymentType pt)
        {
            _repo.Add(pt);
            return Created($"api/PaymentType/{pt.Id}", pt);
        }

        [HttpPatch]
        public IActionResult UpdatePaymentType(PaymentType pt)
        {
            _repo.UpdatePaymentType(pt);

            return NoContent();
        }

        [HttpDelete("{id}")]
        public IActionResult DeletePaymentType(int id)
        {
            _repo.DeletePaymentType(id);
            return Ok();
        }

    }
}
