module "test-nic" {
  source = "./az-lib-network-interface/"
  nic = {
    allocation = "Dynamic"
    ip-address = ""
    location   = module.test-resource-group.location
    nic-count  = 1
    nic-name   = "djs-test"
    pip-id     = module.test-pip.ids[0]
    rg-name    = module.test-resource-group.name
    subnet-id  = data.azurerm_subnet.subnet.id
  }
  tags = var.tags
}
