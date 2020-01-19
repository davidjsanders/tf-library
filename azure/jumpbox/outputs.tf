output "private-ip" {
  value = module.jumpbox-nic.*.ips[0]
}

output "vm-password" {
  value = random_password.password.result
}

output "public-ip" {
  value = module.jumpbox-pip.*.ip-addresses[0]
}