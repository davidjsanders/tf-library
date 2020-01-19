module "vnet" {
  source = "./azure/lib/virtual-network/"

  vnet = {
    address-space = var.vnet.address-space
    location      = module.test-resource-group.location
    rg-name       = module.test-resource-group.name
    vnet-name     = "DJS-TESTING"
    nsg-id        = module.test-nsg.id
  }
  tags = var.tags
}

module "subnet" {
  source = "./azure/lib/subnet/"

  subnet = {
    address_prefix = var.subnet.address-prefix
    rg-name        = module.test-resource-group.name
    vnet-name      = module.vnet.name
    subnet-name    = var.subnet.subnet-name
    nsg-id         = module.test-nsg.id
  }
}