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
    public class FavoriteShopRepository
    {
        const string ConnectionString = "Server=localhost;Database=Toboggan;Trusted_Connection=True;";

        public List<FavoriteShop> GetAll()
        {
            using var db = new SqlConnection(ConnectionString);
            var sql = "SELECT * FROM FavoriteShop";
            return db.Query<FavoriteShop>(sql).ToList();
        }

        public FavoriteShop Get(int id)
        {
            using var db = new SqlConnection(ConnectionString);
            var sql = "SELECT * FROM FavoriteShop WHERE Id = @id";
            var shop = db.QueryFirstOrDefault<FavoriteShop>(sql, new { id = id });
            return shop;
        }

        public void Add(FavoriteShop shop)
        {
            using var db = new SqlConnection(ConnectionString);
            var sql = @"INSERT INTO [FavoriteShop]
                               ([ShopId]
                               ,[UserId])
                         VALUES (@ShopId, @UserId)";
            var id = db.ExecuteScalar<int>(sql, shop);
            shop.Id = id;
        }

        public void Update(FavoriteShop shop)
        {
            using var db = new SqlConnection(ConnectionString);
            var sql = @"UPDATE FavoriteShop
                        SET ShopId = @shopId,
                            UserId = @userId,
                        WHERE Id = @id";
            db.Execute(sql, shop);
        }

        public void Delete(int id)
        {
            using var db = new SqlConnection(ConnectionString);
            var sql = "DELETE FROM FavoriteShop WHERE Id = @id";
            db.Execute(sql, new { id = id });
        }
    }
}
