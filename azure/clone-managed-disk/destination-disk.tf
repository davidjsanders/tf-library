resource "azurerm_managed_disk" "destination-disk" {
    create_option        = "Copy"
    location             = var.destination-disk.location
    name                 = var.destination-disk.disk-name
    resource_group_name  = var.destination-disk.rg-name
    source_resource_id   = azurerm_snapshot.snapshot.id
    storage_account_type = var.destination-disk.storage-account-type
}