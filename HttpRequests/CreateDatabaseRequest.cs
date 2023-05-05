using Newtonsoft.Json;

namespace AstraDb_Custom_Actions.HttpRequests
{
    public class CreateDatabaseRequest
    {
        [JsonProperty("name")]
        public string Name { get; set; }

        [JsonProperty("keyspace")]
        public string Keyspace { get; set; }

        [JsonProperty("cloudProvider")]
        public string CloudProvider { get; set; }

        [JsonProperty("tier")]
        public string Tier { get; set; }

        [JsonProperty("capacityUnits")]
        public int CapacityUnits { get; set; }

        [JsonProperty("region")]
        public string Region { get; set; }

        [JsonProperty("user")]
        public string User { get; set; }

        [JsonProperty("password")]
        public string Password { get; set; }
    }
}