using Newtonsoft.Json;

namespace DataStax.DevOps.ViewModels
{
    public class DatabaseInfo
    {
        [JsonProperty("id")]
        public string Id { get; set; }

        [JsonProperty("orgId")]
        public string OrgId { get; set; }

        [JsonProperty("ownerId")]
        public string OwnerId { get; set; }

        [JsonProperty("info")]
        public Info Info { get; set; }

        [JsonProperty("creationTime")]
        public DateTime CreationTime { get; set; }

        [JsonProperty("terminationTime")]
        public DateTime TerminationTime { get; set; }

        [JsonProperty("status")]
        public string Status { get; set; }
    }
}