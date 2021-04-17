using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Toboggan.Models;
using Microsoft.Data.SqlClient;
using Dapper;


namespace Toboggan.DataAccess
{
    public class PaymentTypeRepository
    {
        const string ConnectionString = "Server=localhost;Database=Toboggan;Trusted_Connection=True;";

        public List<PaymentType> GetAll()
        {
            //create a connection
            using var db = new SqlConnection(ConnectionString);

            //telling the command what you want to do
            var sql = @"Select *
                        From PaymentType";

            return db.Query<PaymentType>(sql).ToList();
        }

        public PaymentType Get(int id)
        {
            var sql = @"Select *
                        From PaymentType
                        Where Id = @id";

            using var db = new SqlConnection(ConnectionString);
            var paymentType = db.QueryFirstOrDefault<PaymentType>(sql, new { id = id });
            return paymentType;
        }

    }
}
