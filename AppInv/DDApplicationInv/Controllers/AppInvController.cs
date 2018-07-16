using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Belgrade.SqlClient;
using System.Data;
using System.Data.SqlClient;
using Microsoft.IdentityModel.Clients.ActiveDirectory;
using Newtonsoft.Json;
using System.IO;

namespace DDApplicationInv.Controllers
{
    [Produces("application/json")]
    [Route("api/AppInv")]
    public class AppInvController : Controller
    {
        private readonly IQueryPipe SqlPipe;
        private readonly ICommand SqlCommand;
        private readonly List<string> keyList;
        private readonly bool validConnection;

        public AppInvController(ICommand sqlCommand, IQueryPipe sqlPipe, List<string> KeyList, string ValidConnection)
        {

            this.SqlCommand = sqlCommand;
            this.SqlPipe = sqlPipe;
            this.keyList = KeyList;
            this.validConnection = false;
            if(ValidConnection == "Valid")
            {
                this.validConnection = true;
            }
        }
    

        //GET: api/AppInv
        [HttpGet]
        public async Task Get(string token)
        {

            if (validConnection)
            {
                if (VerifyToken(token))
                {
                    string sqlString = "SELECT name as 'Model.Name' ,CategoryName as 'Model.CategoryName',left(ApplicationDescription, 256) as 'Model.Description'  ,deploymentDisposition as 'Model.DeploymentDisposition' ,ITOwnerName as 'Model.ITOwnerName' ,ITOwneremailAddress as 'Model.ITOwnerEmailAddress',OwningOrganizationName as 'Model.OwningOrganization' ,left(RecommendationComments, 256) as 'Model.recommendationComments',assetID as 'Model.assetID' ,servicedByExternalOrg as 'Model.servicedByExternalOrg' FROM dbo.ApplicationInventorySOM for json path";
                    var cmd = new SqlCommand(sqlString);
                    await SqlPipe.Stream(cmd, Response.Body, "{}");
                    //await SqlPipe.Stream("SELECT * from dbo.ApplictionInventorySOM FOR JSON PATH", Response.Body, "[]");
                }
                else
                {
                    var cmd = new SqlCommand("select error,description from dbo.error where Id = @id FOR JSON PATH, WITHOUT_ARRAY_WRAPPER");
                    cmd.Parameters.AddWithValue("id", 1);
                    await SqlPipe.Stream(cmd, Response.Body, "{}");
                }
            }
            else
            {
                var result = JsonConvert.SerializeObject(new { error = "Invalid Connection" });
                await Response.WriteAsync(result);
            }
        }

        [HttpGet("{limit}", Name = "Get")]
        public async Task Get(string id, string token)
        {

            if (validConnection)
            {
                if (VerifyToken(token))
                {
                    string sqlString = "SELECT name as 'Model.Name' ,CategoryName as 'Model.CategoryName',left(ApplicationDescription, 256) as 'Model.Description'  ,deploymentDisposition as 'Model.DeploymentDisposition' ,ITOwnerName as 'Model.ITOwnerName' ,ITOwneremailAddress as 'Model.ITOwnerEmailAddress',OwningOrganizationName as 'Model.OwningOrganization' ,left(RecommendationComments, 256) as 'Model.recommendationComments',assetID as 'Model.assetID' ,servicedByExternalOrg as 'Model.servicedByExternalOrg' FROM dbo.ApplicationInventorySOM for json path";
                    var cmd = new SqlCommand(sqlString);
                    //var cmd = new SqlCommand("SELECT name as 'Model.Name' ,CategoryName as 'Model.Category.Name',left(ApplicationDescription, 100) as 'Model.Description'  ,deploymentDisposition as 'Model.Deployment.Disposition' ,ITOwnerName as 'Model.ITOwner.Name' ,ITOwneremailAddress as 'Model.ITOwner.emailAddress',OwningOrganizationName as 'Model.OwningOrganization.Name' ,left(RecommendationComments, 100) as 'Model.recommendationComments',assetID as 'Model.assetID' ,servicedByExternalOrg as 'Model.servicedByExternalOrg' FROM dbo.ApplicationInventorySOM for json path");
                    cmd.Parameters.AddWithValue("id", @id);
                    await SqlPipe.Stream(cmd, Response.Body, "{}");
                    //await SqlPipe.Stream("SELECT * from dbo.ApplictionInventorySOM FOR JSON PATH", Response.Body, "[]");
                }
                else
                {
                    var cmd = new SqlCommand("select error,description from dbo.error where Id = @id FOR JSON PATH, WITHOUT_ARRAY_WRAPPER");
                    cmd.Parameters.AddWithValue("id", 1);
                    await SqlPipe.Stream(cmd, Response.Body, "{}");
                }
            }
            else
            {
                var result = JsonConvert.SerializeObject(new { error = "Invalid Connection"});
                await Response.WriteAsync(result);
            }
        }
        // POST: api/AppInv
        [HttpPost]
        public void Post([FromBody]string value)
        {
        }
        
        // PUT: api/AppInv/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody]string value)
        {
        }
        
        // DELETE: api/ApiWithActions/5
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
        }

        private bool VerifyToken(string token)
        {
            if (keyList.Contains(token))
            {
                return true;
            }
            return false;
        }
    }
}
