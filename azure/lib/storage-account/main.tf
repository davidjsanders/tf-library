resource "azurerm_storage_account" "sa" {
  account_tier             = var.storage-account.account-tier
  account_replication_type = var.storage-account.replication-type
  name                     = lower(var.storage-account.sa-name)
  location                 = var.storage-account.location
  resource_group_name      = var.storage-account.rg-name

  tags = var.tags
}

