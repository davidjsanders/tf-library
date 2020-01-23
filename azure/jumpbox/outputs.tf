output "private-ip" {
  value = module.jumpbox-nic.ips[0]
}

# output "public-ip" {
#   value = data.azurerm_public_ip.post-alloc-pip.ip_address
# }

output "jumpbox-password" {
  value = random_password.password.result
}

output "pip-name" {
  value = module.jumpbox-pip.name
}

output "vm-id" {
  value = module.jumpbox-vm.ids[0]
}

output "vm-name" {
  value = module.jumpbox-vm.names[0]
}