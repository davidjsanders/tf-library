resource "azurerm_public_ip" "jumpbox-pip" {
  allocation_method   = "Dynamic"
  domain_name_label   = var.jumpbox.server-name
  location            = var.jumpbox.location
  name                = var.jumpbox.server-name
  resource_group_name = module.k8s-rg.name
  sku                 = "Basic"
  tags = var.tags
}