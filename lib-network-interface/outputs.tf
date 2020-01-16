output "ids" {
  value = azurerm_network_interface.nic.*.id
}
output "ips" {
  value = azurerm_network_interface.nic.*.private_ip_address
}
