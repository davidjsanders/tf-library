output "private-ip" {
  value = module.linux-server-nic.ips[0]
}

# output "public-ip" {
#   value = data.azurerm_public_ip.post-alloc-pip.ip_address
# }

output "linux-server-password" {
  value = random_password.password.result
}

output "pip-name" {
  value = module.linux-server-pip.name
}

output "nic-ids" {
  value = modue.linux-server-nic.ids
}

output "nic-ips" {
  value = modue.linux-server-nic.ips
}

output "vm-id" {
  value = module.linux-server-vm.ids
}

output "vm-name" {
  value = module.linux-server-vm.names
}