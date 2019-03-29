using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace yxApi.Models.Users
{
    public class Admin
    {
        public int id { get; set; }
        public string username { get; set; }
        public string password { get; set; }
        public string nickname { get; set; }
        public string role { get; set; }
        public string description { get; set; }
    }
}
