output "fqdn" {
    value = azurerm_public_ip.pip.*.fqdn
}

output "ids" {
    value = azurerm_public_ip.pip.*.id
}

output "ip-addresses" {
    value = azurerm_public_ip.pip.*.ip_address
}

output "name" {
    value = azurerm_public_ip.pip.*.name
}