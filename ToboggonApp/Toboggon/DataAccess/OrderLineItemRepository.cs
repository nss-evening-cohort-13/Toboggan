using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Toboggan.Models;
using Microsoft.Data.SqlClient;
using Dapper;

namespace Toboggan.DataAccess
{
    public class OrderLineItemRepository
    {
        const string ConnectionString = "Server=localhost;Database=Toboggan;Trusted_Connection=True;";
        
        public List<OrderLineItem> GetAll()
        {
            using var db = new SqlConnection(ConnectionString);

            var sql = @"Select *
                        From OrderLineItem";
            return db.Query<OrderLineItem>(sql).ToList();
        }

        public OrderLineItem Get(int id)
        {
            var sql = @"Select *
                        From OrderLineItem
                        where Id = @id";

            using var db = new SqlConnection(ConnectionString);

            var orderLineItem = db.QueryFirstOrDefault<OrderLineItem>(sql, new { id = id });
            return orderLineItem;
        }
        public void AddOrderLineItem(OrderLineItem orderLI)
        {
            var sql = @"INSERT INTO [OrderLineItem] ([ProductId], [Quantity], [OrderId])
                        OUTPUT inserted.Id
                        VALUES(@ProductId, @Quantity, @OrderId)";

            using var db = new SqlConnection(ConnectionString);
            var id = db.ExecuteScalar<int>(sql, orderLI);
            orderLI.Id = id;
        }
        public void UpdateOrderLineItem(OrderLineItem orderLI)
        {
            using var db = new SqlConnection(ConnectionString);

            var sql = @"UPDATE [dbo].[OrderLineItem]
                        SET [ProductId] = @ProductId
                            ,[Quantity] = @Quantity
                            ,[OrderId] = @OrderId
                             WHERE Id = @id";

            db.Execute(sql, orderLI);
        }
    }
}
