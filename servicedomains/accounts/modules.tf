module "astradb" {
  source         = "../modules/astradb"
  token          = var.token
  environment    = var.environment
  database       = var.database
}
