using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace yxApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ValuesController : ControllerBase
    {
        // GET api/values
        [HttpGet]
        [Authorize]
        public ActionResult<IEnumerable<string>> Get()
        {
            var currentUser = HttpContext.User;
            var name = currentUser.Claims.FirstOrDefault(c => c.Type == ClaimTypes.Name).Value;
            var role = currentUser.Claims.FirstOrDefault(c => c.Type == ClaimTypes.Role).Value;
            var id = currentUser.Claims.FirstOrDefault(c => c.Type == ClaimTypes.Sid).Value;
            return new string[] { "value1", "value2" };
        }

        // GET api/values/5

        // POST api/values
        [HttpPost]
        public ActionResult<string> Post([FromBody] string value)
        {
            return "Post";
        }

        // PUT api/values/5
        [HttpPut("{id}")]
        public ActionResult<string> Put(int id, [FromBody] string value)
        {
            return "Put";
        }

        // DELETE api/values/5
        [HttpDelete("{id}")]
        public ActionResult<string> Delete(int id)
        {
            return "Delete";
        }
    }
}
