module "test-nsg" {
  source = "./nsg/"
  nsg = {
    location = module.test-resource-group.location
    nsg-name = "djs-test"
    rg-name  = module.test-resource-group.name
  }
  tags = var.tags
}

resource "azurerm_subnet_network_security_group_association" "nsg-assoc" {
  subnet_id                 = data.azurerm_subnet.subnet.id
  network_security_group_id = module.test-nsg.id
}