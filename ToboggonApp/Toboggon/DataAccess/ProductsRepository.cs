using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Toboggan.Models;
using Microsoft.Data.SqlClient;
using Dapper;

namespace Toboggan.DataAccess
{
    public class ProductsRepository
    {
        const string ConnectionString = "Server=localhost; Database=Toboggan; Trusted_Connection=True";

        public List<Product> GetAll()
        {
            var _products = new List<Product>();
            using var db = new SqlConnection(ConnectionString);
            var sql = @"SELECT * FROM Product";
            var results = db.Query<Product>(sql).ToList();
            return results;
        }

        public Product Get(int id)
        {
            var sql = @"SELECT * from Product WHERE Id=@id";
            using var db = new SqlConnection(ConnectionString);
            var product = db.QueryFirstOrDefault<Product>(sql, new { Id = id });
            return product;
        }
    }
}
