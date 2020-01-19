module "test-resource-group" {
  source    = "./az-lib-resource-group/"
  rg        = {
    rg-name  = var.rg-name
    location = var.location
  }
  tags      = var.tags
}
