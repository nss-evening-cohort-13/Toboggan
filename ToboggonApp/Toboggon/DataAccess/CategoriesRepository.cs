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
            //var _products = new List<Category>();
            using var db = new SqlConnection(ConnectionString);
            var sql = @"SELECT * FROM Category ORDER BY [Name] ASC";
            var results = db.Query<Category>(sql).ToList();
            return results;
        }

        public IEnumerable<CategoryProductQuantity> GetQuantityOfProductsPerCategory()
        {
            using var db = new SqlConnection(ConnectionString);
            var sql = @"SELECT
                        [Name], Count(Name) as Quantity
                        FROM Category as c
                        INNER JOIN Product as p
                        ON c.Id = p.CategoryId
                        Group By Name
                        Order By Name Asc";
            var results = db.Query<CategoryProductQuantity>(sql).ToList();
            return results;
        }

        public IEnumerable<CategoryThreeNewestProducts> GetThreeNewestProducts()
        {
            using var db = new SqlConnection(ConnectionString);
            var sql = @"SELECT
                        c.Id as CategoryId, [Name], Title, Price, CreatedDate, ProductImage
                        FROM Category as c
                        INNER JOIN Product as p
                        ON c.Id = p.CategoryId
                        Order By Name Asc";
            var results = db.Query<CategoryThreeNewestProducts>(sql).ToList();
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
