resource "azurerm_network_security_group" "nsg" {
  name                = var.nsg.nsg-name
  location            = var.nsg.location
  resource_group_name = var.nsg.rg-name
  tags                = var.tags
}
