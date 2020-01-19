data "azurerm_virtual_network" "vnet" {
  name                = var.vnet.vnet-name
  resource_group_name = var.vnet.rg-name
}

data "azurerm_storage_account" "storage-account" {
  name                 = var.storage-account.sa-name
  resource_group_name  = var.storage-account.rg-name
}
