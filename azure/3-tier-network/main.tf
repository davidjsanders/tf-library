module "vnet" {
  source = "../lib/virtual-network/"

  vnet = {
    address-space = var.network.address-space
    location      = var.network.location
    rg-name       = var.network.rg-name
    vnet-name     = var.network.vnet-name
  }
  tags = var.tags
}

module "subnet-1" {
  source = "../lib/subnet/"

  subnet = {
    address_prefix = var.network.subnet-prefixes[0]
    rg-name        = var.network.rg-name
    vnet-name      = module.vnet.name
    subnet-name    = var.network.subnet-names[0]
    nsg-id         = var.network.nsg-ids[0]
  }
}

module "subnet-2" {
  source = "../lib/subnet/"

  subnet = {
    address_prefix = var.network.subnet-prefixes[1]
    rg-name        = var.network.rg-name
    vnet-name      = module.vnet.name
    subnet-name    = var.network.subnet-names[1]
    nsg-id         = var.network.nsg-ids[1]
  }
}

module "subnet-3" {
  source = "../lib/subnet/"

  subnet = {
    address_prefix = var.network.subnet-prefixes[2]
    rg-name        = var.network.rg-name
    vnet-name      = module.vnet.name
    subnet-name    = var.network.subnet-names[2]
    nsg-id         = var.network.nsg-ids[2]
  }
}
