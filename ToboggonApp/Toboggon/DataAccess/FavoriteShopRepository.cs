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

        public List<FavoriteShop> GetAllFavoriteShops()
        {
            using var db = new SqlConnection(ConnectionString);
            var sql = "SELECT * FROM FavoriteShop";
            return db.Query<FavoriteShop>(sql).ToList();
        }

        public FavoriteShop GetSingleFavoriteShop(int id)
        {
            using var db = new SqlConnection(ConnectionString);
            var sql = "SELECT * FROM FavoriteShop WHERE Id = @id";
            var shop = db.QueryFirstOrDefault<FavoriteShop>(sql, new { id = id });
            return shop;
        }

        public void AddAFavoriteShop(FavoriteShop shop)
        {
            using var db = new SqlConnection(ConnectionString);

            var sql = @"INSERT INTO [dbo].[FavoriteShop]([ShopId],[UserId])
                        OUTPUT inserted.Id
                        VALUES(@ShopId,@UserId)";

            var id = db.ExecuteScalar<int>(sql, shop);

            shop.Id = id;
        }

        public void UpdateFavoriteShop(FavoriteShop shop)
        {
            using var db = new SqlConnection(ConnectionString);
            var sql = @"UPDATE FavoriteShop
                        SET ShopId = @ShopId,
                            UserId = @UserId
                        WHERE Id = @id";
            db.Execute(sql, shop);
        }

        public void DeleteFavoriteShop(int id)
        {
            using var db = new SqlConnection(ConnectionString);
            var sql = "DELETE FROM FavoriteShop WHERE Id = @id";
            db.Execute(sql, new { id = id });
        }

        public void DeleteFavoriteShopByShopId(int shopId)
        {
            using var db = new SqlConnection(ConnectionString);
            var sql = "DELETE FROM FavoriteShop WHERE ShopId = @shopId";
            db.Execute(sql, new { ShopId = shopId });
        }
    }
}
