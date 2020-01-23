module "vnet" {
  source = "../lib/virtual-network/"

  vnet = {
    address-space = var.network.address-space
    location      = var.network.location
    randomizer    = var.network.randomizer
    rg-name       = var.network.rg-name
    vnet-name     = var.network.vnet-name
  }
  tags = var.tags
}

module "subnet-1" {
  source = "../lib/subnet/"

  subnet = {
    address_prefix = var.network.subnet-prefixes[0]
    nsg-id         = var.network.nsg-ids[0]
    randomizer     = var.network.randomizer
    rg-name        = var.network.rg-name
    subnet-name    = var.network.subnet-names[0]
    vnet-name      = module.vnet.name
  }
}

module "subnet-2" {
  source = "../lib/subnet/"

  subnet = {
    address_prefix = var.network.subnet-prefixes[1]
    nsg-id         = var.network.nsg-ids[1]
    randomizer     = var.network.randomizer
    subnet-name    = var.network.subnet-names[1]
    rg-name        = var.network.rg-name
    vnet-name      = module.vnet.name
  }
}

module "subnet-3" {
  source = "../lib/subnet/"

  subnet = {
    address_prefix = var.network.subnet-prefixes[2]
    nsg-id         = var.network.nsg-ids[2]
    subnet-name    = var.network.subnet-names[2]
    randomizer     = var.network.randomizer
    rg-name        = var.network.rg-name
    vnet-name      = module.vnet.name
  }
}
