output "private-ip" {
  value = module.jumpbox-server.nic-ips[0]
}

# output "public-ip" {
#   value = data.azurerm_public_ip.post-alloc-pip.ip_address
# }

output "jumpbox-password" {
  value = module.jumpbox-server.linux-server-password
}

output "pip-name" {
  value = module.jumpbox-pip.name[0]
}

output "pip-ip-address" {
  value = module.jumpbox-pip.ip-addresses[0]
}

output "vm-id" {
  value = module.jumpbox-server.vm-ids[0]
}

output "vm-name" {
  value = module.jumpbox-server.vm-names[0]
}