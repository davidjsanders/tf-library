module "jumpbox-pip" {
  source = "../lib/public-ip/"
  pip = {
    allocation-method = "Dynamic"
    domain-name-label = var.jumpbox.domain-name-label
    ip-version        = "IPv4"
    location          = var.jumpbox.location
    pip-count         = 1
    pip-name          = var.jumpbox.jumpbox-name
    randomizer        = var.jumpbox.randomizer
    rg-name           = var.jumpbox.rg-name
    sku               = "Basic"
  }
  tags = var.tags
}
