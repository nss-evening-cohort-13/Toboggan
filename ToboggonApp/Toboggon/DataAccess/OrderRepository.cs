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

        public Order GetOrderByUserId(int id)
        {
            var sql = @"select *
                        from [Order]
                        where userId = @Id";

            using var db = new SqlConnection(ConnectionString);

            var order = db.QueryFirstOrDefault<Order>(sql, new { Id = id });

            return order;
        }

        public List<Order> GetOrderAndLineItemsByUserId(int id)
        {
            var orderSql = @"select * from [Order] where userId = @Id";

            using var db = new SqlConnection(ConnectionString);

            var orders = db.Query<Order>(orderSql, new { Id = id }).ToList();
            var orderLineItems =  new List<OrderLineItem>();

            foreach (Order order in orders)
            {  
                var orderLineItemsSql = @"select * from [OrderLineItem] where OrderId = @OrderId";
                orderLineItems = db.Query<OrderLineItem>(orderLineItemsSql, new {  OrderId = order.Id }).ToList();
                order.orderLineItems.AddRange(orderLineItems);
                
            }
            return orders;
        }

        public List<SalesByDate> totalSalesByDate(int id)
        {
            using var db = new SqlConnection(ConnectionString);
            var sql = @"SELECT sum(oli.Quantity* p.Price) AS total,
               DATEPART(year, o.SaleDate) [year], 
               DATEPART(quarter, o.SaleDate)[quarter], 
               DATEPART(month, o.SaleDate)[month], 
               DATEPART(day, o.SaleDate)[day]
               FROM[Order] o JOIN[OrderLineItem] oli ON oli.OrderId = o.Id
               JOIN[Product] p ON p.Id = oli.Id
               JOIN[Shop] s ON s.Id = p.ShopId
               JOIN[User] u ON u.Id = s.UserId
                WHERE u.Id = @id
                GROUP BY DATEPART(year, o.SaleDate), 
                         DATEPART(quarter, o.SaleDate), 
                         DATEPART(month, o.SaleDate), 
                         DATEPART(day, o.SaleDate)
                ORDER BY[year] DESC";

            var totalSalesByDate = db.Query<SalesByDate>(sql, new { Id = id }).ToList();

            return totalSalesByDate;
        }
        public List<SellerDashboard> totalSalesAvgperSeller(int id)
        {
            using var db = new SqlConnection(ConnectionString);

            var sql = @"select sum(oli.Quantity*p.Price) as total,  sum(oli.Quantity) as totQuantity from [Order] o
                          JOIN [OrderLineItem] oli on oli.OrderId = o.Id 
                          JOIN [Product] p ON p.Id = oli.Id
                          JOIN [Shop] s ON s.Id = p.ShopId
                          JOIN [User] u ON u.Id = s.UserId
                          WHERE u.Id = @id";
            var dashboard = db.Query<SellerDashboard>(sql, new { Id = id }).ToList();

            return dashboard;
        }
        
        public List<SellerOrders> SellerOrdersById(int id)
        {
            using var db = new SqlConnection(ConnectionString);

            var sql = @"select s.Id, s.Name as ShopName, o.Id as OrderTableId, o.SaleDate, o.TotalCost, buyer.FirstName, buyer.LastName, c.Name, p.Title, 
                          p.Description, p.Price, oli.Quantity as QuantityBought, 
                          p.Quantity as QuantityLeft from [Order] o
                          JOIN [OrderLineItem] oli on oli.OrderId = o.Id 
                          JOIN [Product] p ON p.Id = oli.Id
                          JOIN [Category] c ON c.Id = P.CategoryId
                          JOIN [Shop] s ON s.Id = p.ShopId
                          JOIN [User] u ON u.Id = s.UserId
						  JOIN [USER] buyer ON buyer.Id = o.UserId
                          WHERE u.Id = @id
                          ORDER BY s.Id ASC, o.SaleDate DESC;";

            var sellerOrders = db.Query<SellerOrders>(sql, new { Id = id }).ToList();

            return sellerOrders;
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
