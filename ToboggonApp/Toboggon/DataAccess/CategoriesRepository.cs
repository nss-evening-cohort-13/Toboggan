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

        public IEnumerable<CategoryProducts> GetCategoryProducts()
        {
            using var db = new SqlConnection(ConnectionString);
            var catSql = @"SELECT
                        c.Id as CategoryId, Count(c.Id) as Quantity, [Name]
                        FROM Category as c
                        INNER JOIN Product as p
                        ON c.Id = p.CategoryId
                        Group By c.Id, [Name]
                        Order By Name Asc";
            var categories = db.Query<CategoryProducts>(catSql).ToList();
            var products = new List<Product>();

            foreach (CategoryProducts category in categories)
            {
                var productsSql = @"SELECT * FROM [Product] WHERE CategoryId = @CategoryId";
                products = db.Query<Product>(productsSql, new { CategoryId = category.CategoryId }).ToList();
                category.Products.AddRange(products);
            }

            return categories;
        }

        //multi-mapping, talk to nathan
        //public IEnumerable<Category> GetCategoryProducts()
        //{
        //    using var db = new SqlConnection(ConnectionString);
        //    var sql = @"SELECT
        //                *
        //                FROM Category as c
        //                INNER JOIN Product as p
        //                ON c.Id = p.CategoryId
        //                Order By Name Asc";
        //    var results = db.Query<Category, Product, Category>(sql, (category, product) =>
        //    {
        //        category.Product = product;
        //        return category;
        //    },
        //    splitOn: "Id");
        //    results.ToList();
        //    return results;
        //}

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

        public List<CategoryData> CategoriesTotalSalesAndInventory(int id)
        {
            using var db = new SqlConnection(ConnectionString);

            var sql = @"select c.Name as CategoryName, SUM(p.Quantity) as ItemsLeft, SUM(p.Price*oli.Quantity) as Cattotal from [Order] o
                          JOIN [OrderLineItem] oli on oli.OrderId = o.Id 
                          JOIN [Product] p ON p.Id = oli.Id
                          JOIN [Category] c ON c.Id = P.CategoryId
                          JOIN [Shop] s ON s.Id = p.ShopId
                          JOIN [User] u ON u.Id = s.UserId
						  JOIN [USER] buyer ON buyer.Id = o.UserId
                          WHERE u.Id = @id
                          GROUP BY c.Name;";

            var categoryData = db.Query<CategoryData>(sql, new { Id = id }).ToList();

            return categoryData;
        }

    }
}
