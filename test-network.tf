module "three-tier-network" {
  source = "./azure/3-tier-network/"

  network = {
    address-space   = ["192.168.1.0/24"]
    location        = module.test-resource-group.location
    nsg-ids         = [module.test-nsg.id, "", ""]
    rg-name         = module.test-resource-group.name
    subnet-prefixes = ["192.168.1.0/27", "192.168.1.32/27", "192.168.1.64/27"]
    subnet-names    = ["DJS-1", "DJS-2", "DJS-3"]
    vnet-name       = "DJS"
  }
  tags    = var.tags
}
