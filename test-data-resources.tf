data "azurerm_virtual_network" "vnet" {
  name                = var.vnet.vnet-name
  resource_group_name = var.vnet.rg-name
}

data "azurerm_subnet" "subnet" {
  name                 = var.subnet.subnet-name
  virtual_network_name = var.subnet.vnet-name
  resource_group_name  = var.subnet.rg-name
}

data "azurerm_storage_account" "storage-account" {
  name                 = var.storage-account-name
  resource_group_name  = var.storage-account-rg
}
