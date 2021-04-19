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

        public Product GetSingleProduct(int id)
        {
            var sql = @"SELECT * from Product WHERE Id=@id";
            using var db = new SqlConnection(ConnectionString);
            var product = db.QueryFirstOrDefault<Product>(sql, new { Id = id });
            return product;
        }

        public void AddAProduct(Product product)
        {
            using var db = new SqlConnection(ConnectionString);
            var sql = @$"INSERT INTO Product(Title,Description,Price, Quantity, ShopId, CategoryId)
                        OUTPUT inserted.Id
                        VALUES(@Title,@Description,@Price, @Quantity, @ShopId, @CategoryId)";

            var id = db.ExecuteScalar<int>(sql, product);

            product.Id = id;
        }

        public void UpdateProduct(Product product)
        {
            using var db = new SqlConnection(ConnectionString);

            var sql = @$"UPDATE Product SET 
                        Title=@Title
                       ,Description=@Description
                       ,Price=@Price
                       ,Quantity=@Quantity
                       ,ShopId=@ShopId
                       ,CategoryId=@CategoryId
                       WHERE Id= @id";

            db.Execute(sql, product);
        }

        public void DeleteProduct(int id)
        {
            using var db = new SqlConnection(ConnectionString);
            var sql = @"DELETE FROM Product WHERE Id= @id";

            db.Execute(sql, new { id });
        }
    }
}
