output "nic-id" {
  value = module.linux-server.*.nic-ids[0]
}

output "nic-name" {
  value = module.linux-server.*.nic-names[0]
}

output "nic-private-ip" {
  value = module.linux-server.*.nic-private-ips[0]
}

output "public-ip" {
    value = data.azurerm_public_ip.jumpbox-pip-data.ip_address
}

output "rg-name" {
  value = module.linux-server.rg-name
}

output "vm-id" {
  value = module.linux-server.*.vm-ids[0]
}

output "vm-name" {
  value = module.linux-server.*.vm-names[0]
}

output "vm-password" {
  value = module.linux-server.vm-password
}

