module "subnet" {
  source          = "./azure/lib/subnet/"

  subnet               = {
    address_prefix = var.subnet.address-prefix
    rg-name        = var.subnet.rg-name
    vnet-name      = var.subnet.vnet-name
    subnet-name    = var.subnet.subnet-name
    nsg-id         = module.test-nsg.id
  }
}