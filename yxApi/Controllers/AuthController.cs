using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.ModelBinding;
using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Tokens;
using Swashbuckle.AspNetCore.Annotations;
using yxApi.DbHelper.IRepository;
using yxApi.Models;
using yxApi.Models.Forms;
using yxApi.Models.RestfulData;
using yxApi.Utils;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace yxApi.Controllers
{
    [Route("api/[controller]")]
    public class AuthController : Controller
    {
        /// <summary>
        /// 登陆获取token
        /// </summary> 
        [EnableCors("MPolicy")]
        [HttpPost]
        [SwaggerResponse(200, "登陆成功", typeof(RestfulData<TokenObj>))]
        [SwaggerResponse(400, null, typeof(RestfulData))]
        public async Task<ActionResult> Sigin([FromBody, BindRequired] SigninForm signinForm)
        {
            var result = new RestfulData<TokenObj>();
            //验证用户名和密码
            var userInfo = await new AdminDao().GetAdmin(signinForm.username, signinForm.password);
            if (userInfo != null)
            {
                var claims = new Claim[]
                {
                   new Claim(ClaimTypes.Name,userInfo.username),
                   new Claim(ClaimTypes.Role,userInfo.role),
                   new Claim(ClaimTypes.Sid,userInfo.id.ToString()),
                };    
                var key = new SymmetricSecurityKey(System.Text.Encoding.UTF8.GetBytes(ConfigHelper.GetValueByKey("SecurityKey")));
                var expires = DateTime.Now.AddDays(30);//
                var token = new JwtSecurityToken(
                            issuer: ConfigHelper.GetValueByKey("issuer"),
                            audience: ConfigHelper.GetValueByKey("audience"),
                            claims: claims,
                            notBefore: DateTime.Now,
                            expires: expires,
                            signingCredentials: new SigningCredentials(key, SecurityAlgorithms.HmacSha256));
                //生成Token
                string jwtToken = new JwtSecurityTokenHandler().WriteToken(token);
                result.code = 200;
                result.data = new TokenObj() { token = jwtToken, expires = expires.ToFileTimeUtc() };
                result.message = "授权成功！";
                return Ok(result);
            }
            else
            {
                result.message = "账号或密码错误";
                result.code = 400;
                return BadRequest(result);
            }

        }

    }
}
