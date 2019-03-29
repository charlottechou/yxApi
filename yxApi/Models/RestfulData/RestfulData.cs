using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace yxApi.Models.RestfulData
{
    public class RestfulData
    {
        /// <summary>
        /// <![CDATA[错误码]]>
        /// </summary>
        public int code { get; set; }

        /// <summary>
        ///<![CDATA[消息]]>
        /// </summary>
        public string message { get; set; }

    }

    /// <summary>
    ///
    /// </summary>
    /// <typeparam name="T"></typeparam>
    public class RestfulData<T> : RestfulData
    {
        /// <summary>
        /// <![CDATA[数据]]>
        /// </summary>
        public virtual T data { get; set; }
    }

    /// <summary>
    /// <![CDATA[返回数组]]>
    /// </summary>
    /// <typeparam name="T"></typeparam>
    public class RestfulArray<T> : RestfulData<IEnumerable<T>>
    {

    }
}
