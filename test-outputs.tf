output "internal-ips" {
  value = module.test-nic.ips
}

output "vm-password" {
  value = random_password.password.result
}

output "public-ip" {
  value = module.test-pip.ip-addresses
}