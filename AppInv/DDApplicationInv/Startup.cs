using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;
using System.Data;
using System.Data.SqlClient;
using Belgrade.SqlClient;
using Belgrade.SqlClient.SqlDb;

namespace DDApplicationInv
{
    public class Startup
    {

         public Startup(IHostingEnvironment env)
        {
            var builder = new ConfigurationBuilder()
                .SetBasePath(env.ContentRootPath)
                .AddJsonFile("appsettings.json", optional: true, reloadOnChange: true)
                .AddJsonFile($"appsettings.{env.EnvironmentName}.json", optional: true);

            
            if (env.IsEnvironment("Development"))
            {
                // This will push telemetry data through Application Insights pipeline faster, allowing you to view results immediately.
                builder.AddApplicationInsightsSettings(developerMode: true);
            }

            builder.AddEnvironmentVariables();
            Configuration = builder.Build();
        }

        public IConfigurationRoot Configuration { get; set; }

        // This method gets called by the runtime. Use this method to add services to the container
        public void ConfigureServices(IServiceCollection services)
        {
            string ConnString = "";
            List<string> keyList = new List<string>();

            // Add framework services.
            services.AddOptions();

            string pkey = Configuration.GetValue<string>("AppKey:Key");
            string server = Configuration.GetValue<string>("connection:server");
            string catalog = Configuration.GetValue<string>("connection:InitialCatalog");
            string uid = Configuration.GetValue<string>("connection:UserID");
            string pwd = Configuration.GetValue<string>("connection:Pwd");
            string ValidConnection = "";
            if (!(string.IsNullOrEmpty(server) || string.IsNullOrEmpty(catalog) || string.IsNullOrEmpty(uid) || string.IsNullOrEmpty(pwd)))
            {
                ValidConnection = "Valid";
            }

            ConnString = string.Format("Server={0}; Initial Catalog={1}; Persist Security Info=False; User ID={2}; Password={3}; MultipleActiveResultSets=False; Encrypt=True; TrustServerCertificate=False; Connection Timeout=30;", server, catalog, uid, pwd);

            string keyone = Configuration.GetValue<string>("token:one");
            keyList.Add(Configuration.GetValue<string>("token:one"));
            keyList.Add(Configuration.GetValue<string>("token:two"));
            keyList.Add(Configuration.GetValue<string>("token:three"));
            keyList.Add(Configuration.GetValue<string>("token:four"));
            keyList.Add(Configuration.GetValue<string>("token:five"));
            keyList.Add(Configuration.GetValue<string>("token:six"));

            services.AddApplicationInsightsTelemetry(Configuration);

            services.AddTransient<IQueryPipe>(_ => new QueryPipe(new SqlConnection(ConnString)));
            services.AddTransient<ICommand>(_ => new Command(new SqlConnection(ConnString)));
            services.AddTransient<List<string>>(_ => keyList);
            services.AddTransient<string>(_ => ValidConnection);
            
            services.AddMvc();
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline
        public void Configure(IApplicationBuilder app, IHostingEnvironment env, ILoggerFactory loggerFactory)
        {
            loggerFactory.AddConsole(Configuration.GetSection("Logging"));
            loggerFactory.AddDebug();

            app.UseApplicationInsightsRequestTelemetry();

            app.UseApplicationInsightsExceptionTelemetry();

            app.UseMvc();
        }
    }
}
