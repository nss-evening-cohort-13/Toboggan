using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.Data.SqlClient;
using Microsoft.Extensions.Configuration;
using Dapper;
using Toboggan.Models;

namespace Toboggan.DataAccess
{
    public class ShopRepository
    {
        const string ConnectionString = "Server=localhost;Database=Toboggan;Trusted_Connection=True;";

        public List<Shop> GetAll()
        {
            using var db = new SqlConnection(ConnectionString);
            var sql = "SELECT * FROM Shop";
            return db.Query<Shop>(sql).ToList();
        }

        public Shop Get(int id)
        {
            using var db = new SqlConnection(ConnectionString);
            var sql = "SELECT * FROM Shop WHERE Id = @id";
            var shop = db.QueryFirstOrDefault<Shop>(sql, new { id = id });
            return shop;
        }

        public void Add(Shop shop)
        {
            using var db = new SqlConnection(ConnectionString);
            var sql = @"INSERT INTO [Shop]
                               ([Name]
                               ,[UserId])
                         VALUES (@Name, @UserId)";
            var id = db.ExecuteScalar<int>(sql, shop);
            shop.Id = id;
        }

        public void Update(Shop shop)
        {
            using var db = new SqlConnection(ConnectionString);
            var sql = @"UPDATE Shop
                        SET Name = @name,
                            UserId = @userId,
                        WHERE Id = @id";
            db.Execute(sql, shop);
        }

        public void Delete(int id)
        {
            using var db = new SqlConnection(ConnectionString);
            var sql = "DELETE FROM Shop WHERE Id = @id";
            db.Execute(sql, new { id = id });
        }
    }
}