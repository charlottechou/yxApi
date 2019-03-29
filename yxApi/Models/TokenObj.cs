using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace yxApi.Models
{
    public class TokenObj
    {   
        public string token { get; set; }
        /// <summary>
        /// token过期时间
        /// </summary>
        public long expires { get; set; }
    }
}
