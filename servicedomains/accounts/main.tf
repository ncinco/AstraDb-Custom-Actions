module "astradb" {
  source         = "./terraforms/modules/astradb"
  token          = var.token
  environment    = var.environment
  database       = var.database
}
