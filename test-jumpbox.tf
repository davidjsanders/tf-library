module "jumpbox" {
  source    = "./az-jumpbox/"
  rg        = {
    rg-name  = var.rg-name
    location = var.location
  }
  tags      = var.tags
}
