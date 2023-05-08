terraform {
  required_providers {
    astra = {
      source  = "datastax/astra"
      version = ">=1.0.0"
    }
  }
}

variable "token" {}

provider "astra" {
  // This can also be set via ASTRA_API_TOKEN environment variable.
  token = var.ASTRA_API_TOKEN
}
