using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.Data.SqlClient;
using Dapper;
using Toboggan.Models;

namespace Toboggan.DataAccess
{
    public class UserRepository
    {
        const string ConnectionString = "Server=localhost;Database=Toboggan;Trusted_Connection=True";

        public List<User> GetAll()
        {
            using var connection = new SqlConnection(ConnectionString);

            var userSql = "select * from [User]";
            //var shopSql = "select * from [Shop] where UserId is not null";

            var users = connection.Query<User>(userSql).ToList();
            //var shops = db.Query<Shop>(shopSql);

            //foreach (var user in users)
            //{
            //    user.Shops = shops.Where(s => s.UserId == user.Id).ToList();
            //}

            return (List<User>)users;
        }

        public User GetSingleUser(string id)
        {
            var sql = @"select *
                        from [User]
                        where Id = @Id";

            using var db = new SqlConnection(ConnectionString);

            var user = db.QueryFirstOrDefault<User>(sql, new { Id = id });

            return user;

        }

        public List<dynamic> GetSellers()
        {
            using var db = new SqlConnection(ConnectionString);

            var sql = @"select DISTINCT u.Id, u.FirstName, u.LastName, u.Email, u.ImageUrl, u.CreatedDate from Shop s
		                       LEFT JOIN [User] u on u.Id = s.UserId";

            var sellers = db.Query(sql).ToList();

            return sellers;
        }

        public void AddAUser(User user)
        {
            using var db = new SqlConnection(ConnectionString);

            var sql = @"INSERT INTO [dbo].[User]([Id],[FirstName],[LastName],[Email],[ImageUrl],[TotalSales])
                        VALUES(@Id, @FirstName,@LastName,@Email,@ImageUrl,@TotalSales)";

            var id = db.ExecuteScalar<string>(sql, user);

            user.Id = id;
        }

        public void UpdateUser(User user)
        {
            using var db = new SqlConnection(ConnectionString);

            var sql = @"UPDATE [dbo].[User]
                        SET [FirstName] = @FirstName
                            ,[LastName] = @LastName
                            ,[Email] = @Email
                            ,[ImageUrl] = @ImageUrl
                            ,[CreatedDate] = @CreatedDate
                            ,[TotalSales] = @TotalSales
                             WHERE Id = @id";

            db.Execute(sql, user);
        }

        public void DeleteUser(string id)
        {
            using var db = new SqlConnection(ConnectionString);

            var user = GetSingleUser(id);

            var sql = @"UPDATE[dbo].[User]
                        SET[FirstName] = 'Deleted'
                            ,[LastName] = 'User'
                            ,[Email] = Null
                            ,[ImageUrl] = Null
                            ,[TotalSales] = Null
                             WHERE Id = @id";

            db.Execute(sql, user);
        }

        public List<ShopOrderHistory> GetShopOrderHistoryOfUser(string id)
        {
            using var db = new SqlConnection(ConnectionString);

            var sql = @"select s.Id as ShopId, s.Name as ShopName, o.Id as OrderTableId, c.Name as CategoryName, o.SaleDate, o.TotalCost, c.Name, p.Title, 
                          p.Description, p.Price, oli.Quantity as QuantityBought
                          from [Order] o
                          JOIN [OrderLineItem] oli on oli.OrderId = o.Id 
                          JOIN [Product] p ON p.Id = oli.Id
                          JOIN [Category] c ON c.Id = P.CategoryId
                          JOIN [Shop] s ON s.Id = p.ShopId
                          JOIN [User] u ON u.Id = s.UserId
						  JOIN [USER] buyer ON buyer.Id = o.UserId
                          WHERE buyer.Id = @id
                          ORDER BY s.Id ASC, o.SaleDate DESC;";

            var sellerOrders = db.Query<ShopOrderHistory>(sql, new { Id = id }).ToList();

            return sellerOrders;
        }

        public List<dynamic> GetPurchaseHistory(string id)
        {
            using var db = new SqlConnection(ConnectionString);

            var sql = @"select p.Title, p.Description, p.Price, p.ProductImage, p.ShopId,oli.Quantity, o.SaleDate, u.FirstName, u.LastName, o.Id from [OrderLineItem] oli
				        JOIN [Order] o on o.Id = oli.OrderId
				        JOIN [Product] p on p.Id = oli.ProductId
                        JOIN [Shop] s on s.Id = p.ShopId
				        JOIN [User] u on u.Id = s.UserId
				        WHERE o.UserId = @Id
				        ORDER BY o.SaleDate DESC";

            var purchaseHistory = db.Query(sql, new { Id = id }).ToList();

            return purchaseHistory;

        }

    }
}
