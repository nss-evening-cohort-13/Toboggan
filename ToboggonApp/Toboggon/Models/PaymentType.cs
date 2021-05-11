using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Toboggan.Models
{
    //Models are for storing pieces of information, not for having behavior
    public class PaymentType
    {
        public int Id { get; set; }
        public int AccountNumber { get; set; }
        public PaymentTypeName Name { get; set; }
        public string UserId { get; set; }
    }

    public enum PaymentTypeName
    {
        MasterCard,
        Visa,
        PayPal,
        Discover
    }

}
