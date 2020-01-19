output "private-ip" {
  value = module.jumpbox-nic.ips[0]
}

output "public-ip" {
  value = module.jumpbox-pip.ip-addresses[0]
}

output "jumpbox-password" {
  value = random_password.password.result
}