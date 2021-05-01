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

            var sql = @"select *
                        from [User]";

            var results = connection.Query<User>(sql).ToList();

            return results;
        }

        public User GetSingleUser(int id)
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

            var sql = @"select DISTINCT UserId 
                                from Shop";

            var sellers = db.Query(sql).ToList();

            return sellers;
        }

        public void AddAUser(User user)
        {
            using var db = new SqlConnection(ConnectionString);

            var sql = @"INSERT INTO [dbo].[User]([FirstName],[LastName],[Email],[ImageUrl],[TotalSales])
                        OUTPUT inserted.Id
                        VALUES(@FirstName,@LastName,@Email,@ImageUrl,@TotalSales)";

            var id = db.ExecuteScalar<int>(sql, user);

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

        public void DeleteUser(int id)
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

    }
}
