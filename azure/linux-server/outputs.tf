output "vm-ids" {
  value = azurerm_virtual_machine.vm.*.id
}

output "nic-ids" {
  value = azurerm_network_interface.nic.*.id
}

output "vm-names" {
  value = azurerm_virtual_machine.vm.*.name
}

output "nic-names" {
  value = azurerm_network_interface.nic.*.name
}

output "nic-private-ips" {
  value = azurerm_network_interface.nic.*.private_ip_address
}

output "vm-password" {
  value = random.random_password.password.result
}

# output "private-ip" {
#   value = module.linux-server-nic.ips[0]
# }

# # output "public-ip" {
# #   value = data.azurerm_public_ip.post-alloc-pip.ip_address
# # }

# output "linux-server-password" {
#   value = random_password.password.result
# }

# output "nic-ids" {
#   value = module.linux-server-nic.ids
# }

# output "nic-ips" {
#   value = module.linux-server-nic.ips
# }

# output "rg-name" {
#   value = module.linux-server-vm.rg-name
# }

# output "vm-id" {
#   value = module.linux-server-vm.id
# }

# output "vm-name" {
#   value = module.linux-server-vm.name
# }