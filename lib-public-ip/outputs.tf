output "ids" {
    value = azurerm_public_ip.pip.*.id
}

output "ip-addresses" {
    value = azurerm_public_ip.pip.*.ip_address
}

output "fqdn" {
    value = azurerm_public_ip.pip.*.fqdn
}