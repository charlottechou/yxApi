using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace yxApi.Models.Forms
{
    public class SigninForm
    {
        /// <summary>
        /// 用户类型(1管理员；2学生)
        /// </summary>
        [Required]
        public int category { get; set; }
        /// <summary>
        /// 用户名
        /// </summary>
        [Required]
        public string username { get; set; }
        /// <summary>
        /// 密码
        /// </summary>
        [Required]
        public string password { get; set; }
    }
}
