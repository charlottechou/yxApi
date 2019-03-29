using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Configuration.Json;
using Microsoft.Extensions.FileProviders;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;

namespace yxApi.Utils
{

    public static class ConfigHelper
    {

        public static string GetValueByKey(string key)
        {
            var jsonConfig = new JsonConfigurationSource();
            jsonConfig.FileProvider = new PhysicalFileProvider(Directory.GetCurrentDirectory());
            jsonConfig.Path = "appsettings.json";
            var jsonProvider = new JsonConfigurationProvider(jsonConfig);
            jsonProvider.Load();

            jsonProvider.TryGet(key, out string value);

            if (string.IsNullOrWhiteSpace(value))
            {
                throw new Exception(string.Concat("Can not find ",key," from appsettings.json"));
            }
            return value;
        }
    }

}
