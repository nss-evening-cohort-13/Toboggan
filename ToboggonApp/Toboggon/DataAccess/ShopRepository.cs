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

        public List<Shop> GetAllShops()
        {
            using var db = new SqlConnection(ConnectionString);
            var sql = @"SELECT * FROM Shop
                                 ORDER BY UserId ASC";
            return db.Query<Shop>(sql).ToList();
        }

        public Shop GetSingleShop(int id)
        {
            using var db = new SqlConnection(ConnectionString);
            var sql = "SELECT * FROM Shop WHERE Id = @id";
            var shop = db.QueryFirstOrDefault<Shop>(sql, new { id = id });
            return shop;
        }

        public Shop GetSingleShopByUserId(string userId)
        {
            using var db = new SqlConnection(ConnectionString);
            var sql = "SELECT * FROM Shop WHERE UserId = @userId";
            var shop = db.QueryFirstOrDefault<Shop>(sql, new { UserId = userId });
            return shop;
        }

        public void AddAShop(Shop shop)
        {
            using var db = new SqlConnection(ConnectionString);

            var sql = @"INSERT INTO [dbo].[Shop]([Name],[UserId],[ShopImage],[Description])
                        OUTPUT inserted.Id
                        VALUES(@Name,@UserId,@ShopImage, @Description)";

            var id = db.ExecuteScalar<int>(sql, shop);

            shop.Id = id;
        }

        public void UpdateShop(Shop shop)
        {
            using var db = new SqlConnection(ConnectionString);
            var sql = @"UPDATE [dbo].[Shop]
                        SET [Name] = @Name,
                            [UserId] = @UserId,
                            [ShopImage] = @ShopImage,
                            [Description] = @Description
                        WHERE Id = @id";
            db.Execute(sql, shop);
        }

        public void DeleteShop(int id)
        {
            using var db = new SqlConnection(ConnectionString);
            var sql = "DELETE FROM Shop WHERE Id = @id";
            db.Execute(sql, new { id = id });
        }
    }
}