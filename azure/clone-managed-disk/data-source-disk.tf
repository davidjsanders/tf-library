data "azurerm_managed_disk" "source-disk" {
    name                = var.source-disk.disk-name
    resource_group_name = var.source-disk.rg-name
}