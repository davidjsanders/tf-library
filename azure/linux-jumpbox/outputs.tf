output "nic-id" {
  value = module.jumpbox.*.nic-ids[0]
}

output "nic-name" {
  value = module.jumpbox.*.nic-names[0]
}

output "nic-private-ip" {
  value = module.jumpbox.*.nic-private-ips[0]
}

output "public-ip" {
    value = data.azurerm_public_ip.jumpbox-pip-data.ip_address
}

output "rg-name" {
  value = module.jumpbox.rg-name
}

output "vm-id" {
  value = module.jumpbox.*.vm-ids[0]
}

output "vm-name" {
  value = module.jumpbox.*.vm-names[0]
}

output "vm-password" {
  value = module.jumpbox.vm-password
}

