output "fqdn" {
  value = module.jumpbox-pip.fqdn[0]
}

output "jumpbox-password" {
  value = module.jumpbox-server.linux-server-password
}

output "pip-name" {
  value = module.jumpbox-pip.name[0]
}

output "pip-ip-address" {
  value = module.jumpbox-pip.ip-addresses[0]
}

output "private-ip" {
  value = module.jumpbox-server.nic-ips[0]
}

output "vm-id" {
  value = module.jumpbox-server.vm-ids[0]
}

output "vm-name" {
  value = module.jumpbox-server.vm-names[0]
}