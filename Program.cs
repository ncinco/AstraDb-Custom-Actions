using AstraDb_Custom_Actions.HttpRequests;
using CommandLine;
using DataStax.DevOps.ViewModels;
using Newtonsoft.Json;
using RestSharp;

namespace AstraDb_Custom_Actions
{
    public class Options
    {
        [Option('t', "token", Required = true, HelpText = "AstraDB token.")]
        public string Token { get; set; }

        [Option('d', "database", Required = true, HelpText = "Database name.")]
        public string Database { get; set; }
    }

    public class Program
    {
        static void Main(string[] args)
        {
            var options = new Options();

            Parser.Default.ParseArguments<Options>(args)
               .WithParsed(o =>
               {
                   options = o;
               });

            Console.WriteLine($"Current Arguments: -t {options.Token}");

            var restClientOptions = new RestClientOptions("https://api.astra.datastax.com");
            var restClient = new RestClient(restClientOptions);
            restClient.AddDefaultHeader("Authorization", $"Bearer {options.Token}");

            var listResult = restClient.GetJson<List<DatabaseInfo>>("v2/databases");

            var found = listResult.Any(x => string.Compare(x.Info.Name, options.Database, StringComparison.InvariantCultureIgnoreCase) == 0);

            if (!found)
            {
                var request = new RestRequest("v2/databases");
                var requestBody = new CreateDatabaseRequest
                {
                    Name = "cicd_database",
                    Keyspace = "accounts",
                    CloudProvider = "AZURE",
                    Tier = "serverless",
                    CapacityUnits = 1,
                    Region = "australiaeast",
                    User = "db_admin",
                    Password = "db_admin"
                };

                request.AddJsonBody(JsonConvert.SerializeObject(requestBody));

                var createResult = restClient.Post(request);
            }
        }
    }
}