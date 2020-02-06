resource "azurerm_snapshot" "snapshot" {
    create_option       = "Copy"
    disk_size_gb        = data.azurerm_managed_disk.source-disk.disk-size-gb
    encryption_settings = data.azurerm_managed_disk.source-disk.encryption_settings
    location            = var.destination-disk.location
    name                = format(
        "SNAPSHOT-%s%s",
        data.azurerm_managed_disk.source-disk.name,
        var.randomizer
    )
    resource_group_name = var.destination-disk.rg-name
    source_uri          = data.azurerm_managed_disk.source-disk.id
    tags                = var.tags
}