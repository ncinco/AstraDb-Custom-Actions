using Newtonsoft.Json;

namespace DataStax.DevOps.ViewModels
{
    public class Info
    {
        [JsonProperty("name")]
        public string Name { get; set; }

        [JsonProperty("keyspaces")]
        public List<string> Keyspaces { get; set; }

        [JsonProperty("datacenters")]
        public List<DataCenter> Datacenters { get; set; }

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
    }
}
