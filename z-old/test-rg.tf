module "k8s-resource-group" {
  source    = "./resource-group/"
  rg        = {
    rg-name  = var.rg-name
    location = var.location
  }
  tags      = var.tags
}
