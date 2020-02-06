output "snapshot-id" {
    value = azurerm_snapshot.snapshot.id
}

output "source-disk-id" {
    value = data.azurerm_managed_disk.source-disk.id
}

output "disk-size-gb" {
    value = azurerm_snapshot.snapshot.disk_size_gb
}