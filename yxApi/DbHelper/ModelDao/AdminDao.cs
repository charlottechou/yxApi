using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;
using yxApi.Models.Users;

namespace yxApi.DbHelper.IRepository
{
    public class AdminDao : DaoBase<Admin, Int32>
    {

        public Task<Admin> GetAdmin(string username,string password)
        {
            return GetAsync("select * from v_admin where username=@username and password=@password", 
                new { username, password });
        }
    }
}
