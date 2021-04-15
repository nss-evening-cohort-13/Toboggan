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

        public void AddAUser(User user)
        {
            using var db = new SqlConnection(ConnectionString);

            var sql = @"INSERT INTO [dbo].[User]([FirstName],[LastName],[Email],[ImageUrl],[CreatedDate],[TotalSales])
                        OUTPUT inserted.Id
                        VALUES(@FirstName,@LastName,@Email,@ImageUrl,@CreatedDate,@TotalSales)";

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


    }
}
