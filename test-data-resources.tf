data "azurerm_storage_account" "storage-account" {
  name                 = var.storage-account.sa-name
  resource_group_name  = var.storage-account.rg-name
}