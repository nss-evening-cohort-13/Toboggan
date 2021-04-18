using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.Data.SqlClient;
using Dapper;
using Toboggan.Models;


namespace Toboggan.DataAccess
{
    public class OrderRepository
    {
        const string ConnectionString = "Server=localhost;Database=Toboggan;Trusted_Connection=True";

        public List<Order> GetAll()
        {
            using var connection = new SqlConnection(ConnectionString);

            var sql = @"select *
                        from [Order]";

            var results = connection.Query<Order>(sql).ToList();

            return results;
        }

        public Order GetSingleOrder(int id)
        {
            var sql = @"select *
                        from [Order]
                        where Id = @Id";

            using var db = new SqlConnection(ConnectionString);

            var order = db.QueryFirstOrDefault<Order>(sql, new { Id = id });

            return order;
        }

        public void AddAnOrder(Order order)
        {
            using var db = new SqlConnection(ConnectionString);

            var sql = @"INSERT INTO [dbo].[Order]([UserId],[TotalCost],[PaymentTypeId],[SaleDate],[OrderLineItemId])
                        OUTPUT inserted.Id
                        VALUES(@UserId,@TotalCost,@PaymentTypeId,@SaleDate,@OrderLineItemId)";

            var id = db.ExecuteScalar<int>(sql, order);

            order.Id = id;
        }

        public void UpdateOrder(Order order)
        {
            using var db = new SqlConnection(ConnectionString);

            var sql = @"UPDATE [dbo].[Order]
                        SET [UserId] = @UserId
                        ,[TotalCost] = @TotalCost
                        ,[PaymentTypeId] = @PaymentTypeId
                        ,[SaleDate] = @SaleDate
                        ,[OrderLineItemId] = @OrderLineItemId
                        WHERE Id = @id";

            db.Execute(sql, order);
        }

        public void DeleteOrder(int id)
        {
            using var db = new SqlConnection(ConnectionString);

            var sql = "Delete from Order Where Id = @id";

            db.Execute(sql, new { id });
        }
    }
}
