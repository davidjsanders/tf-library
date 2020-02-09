output "hostnames" {
  value = local.l-hostnames
}

output "nic-ids" {
  value = azurerm_network_interface.nic.*.id
}

output "nic-names" {
  value = azurerm_network_interface.nic.*.name
}

output "nic-private-ips" {
  value = azurerm_network_interface.nic.*.private_ip_address
}

output "rg-name" {
  value = azurerm_virtual_machine.vm.*.resource_group_name[0]
}

output "vm-ids" {
  value = azurerm_virtual_machine.vm.*.id
}

output "vm-names" {
  value = azurerm_virtual_machine.vm.*.name
}

output "vm-password" {
  value = random_password.password.result
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

# output "vm-id" {
#   value = module.linux-server-vm.id
# }

# output "vm-name" {
#   value = module.linux-server-vm.name
# }