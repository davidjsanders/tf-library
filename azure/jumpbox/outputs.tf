output "private-ip" {
  value = module.jumpbox-nic.ips[0]
}

# output "public-ip" {
#   value = data.azurerm_public_ip.post-alloc-pip.ip_address
# }

output "jumpbox-password" {
  value = random_password.password.result
}