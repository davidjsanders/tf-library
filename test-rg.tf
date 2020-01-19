module "test-resource-group" {
  source    = "./azure/lib/resource-group/"
  rg        = {
    rg-name  = var.rg-name
    location = var.location
  }
  tags      = var.tags
}
