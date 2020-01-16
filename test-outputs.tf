output "ip-addresses" {
  value = module.test-nic.ips
}
output "vm-password" {
  value = random_password.password.result
}