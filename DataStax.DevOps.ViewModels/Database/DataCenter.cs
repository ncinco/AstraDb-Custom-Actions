using Newtonsoft.Json;

namespace DataStax.DevOps.ViewModels
{
    public class DataCenter
    {
        [JsonProperty("id")]
        public string Id { get; set; }

        [JsonProperty("name")]
        public string Name { get; set; }

        [JsonProperty("status")]
        public string Status { get; set; }

        [JsonProperty("tier")]
        public string Tier { get; set; }

        [JsonProperty("cloudProvider")]
        public string CloudProvider { get; set; }

        [JsonProperty("region")]
        public string Region { get; set; }

        [JsonProperty("regionZone")]
        public string RegionZone { get; set; }

        [JsonProperty("regionClassification")]
        public string RegionClassification { get; set; }

        [JsonProperty("capacityUnits")]
        public int CapacityUnits { get; set; }

        [JsonProperty("secureBundleUrl")]
        public string SecureBundleUrl { get; set; }

        [JsonProperty("secureBundleInternalUrl")]
        public string SecureBundleInternalUrl { get; set; }

        [JsonProperty("secureBundleMigrationProxyUrl")]
        public string SecureBundleMigrationProxyUrl { get; set; }

        [JsonProperty("secureBundleMigrationProxyInternalUrl")]
        public string SecureBundleMigrationProxyInternalUrl { get; set; }

        [JsonProperty("dateCreated")]
        public DateTime DateCreated { get; set; }
    }
}
