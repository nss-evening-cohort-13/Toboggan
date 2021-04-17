using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.Data.SqlClient;
using Dapper;
using Toboggan.Models;

namespace Toboggan.DataAccess
{
    public class CategoriesRepository
    {
        const string ConnectionString = "Server=localhost; Database=Toboggan; Trusted_Connection=True";

        public List<Category> GetAll()
        {
            var _products = new List<Category>();
            using var db = new SqlConnection(ConnectionString);
            var sql = @"SELECT * FROM Category";
            var results = db.Query<Category>(sql).ToList();
            return results;
        }

        public Category GetSingleCategory(int id)
        {
            var sql = @"SELECT * from Category WHERE Id = @id";
            using var db = new SqlConnection(ConnectionString);
            var product = db.QueryFirstOrDefault<Category>(sql, new { Id = id });
            return product;
        }

        public void AddACategory(Category category)
        {
            using var db = new SqlConnection(ConnectionString);
            var sql = @"INSERT INTO Category(Name) 
                              OUTPUT inserted.Id 
                              VALUES (@Name)";
            var id = db.ExecuteScalar<int>(sql, category);
            category.Id = id;
        }

        public void UpdateCategory(Category category)
        {
            using var db = new SqlConnection(ConnectionString);
            var sql = @"UPDATE Category 
                    SET Name=@Name
                    WHERE Id = @id";
            db.Execute(sql,category);
        }

        public void DeleteCategory(int id)
        {
            using var db = new SqlConnection(ConnectionString);
            var sql = @"DELETE FROM Category WHERE Id=@id";
            db.Execute(sql, new { id });
        }
    }
}
