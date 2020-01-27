output "private-ip" {
  value = module.linux-server-nic.ips[0]
}

# output "public-ip" {
#   value = data.azurerm_public_ip.post-alloc-pip.ip_address
# }

output "linux-server-password" {
  value = random_password.password.result
}

output "nic-ids" {
  value = module.linux-server-nic.ids
}

output "nic-ips" {
  value = module.linux-server-nic.ips
}

output "rg-names" {
  value = module.linux-server-vm.rg-names
}

output "vm-ids" {
  value = module.linux-server-vm.ids
}

output "vm-names" {
  value = module.linux-server-vm.names
}