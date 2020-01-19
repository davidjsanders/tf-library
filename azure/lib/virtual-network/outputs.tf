output "id" {
  value = azurerm_virtual_network.vnet.id
}

output "name" {
  value = azurerm_virtual_network.vnet.name
}

output "address-prefix" {
  value = azurerm_virtual_network.vnet.address_space
}