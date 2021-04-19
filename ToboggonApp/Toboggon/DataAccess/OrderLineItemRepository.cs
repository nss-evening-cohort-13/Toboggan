﻿using System;
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
    }
}