module "test-nsg" {
  source = "./azure/lib/nsg/"
  nsg = {
    location = module.test-resource-group.location
    nsg-name = var.jumpbox.jumpbox-name
    rg-name  = module.test-resource-group.name
  }
  tags = var.tags
}

resource "azurerm_subnet_network_security_group_association" "nsg-assoc" {
  subnet_id                 = module.subnet.id
  network_security_group_id = module.test-nsg.id
}