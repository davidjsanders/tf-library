output "ip" {
    value = module.jumpbox.private-ip
}

output "public-ip" {
    value = module.jumpbox.public-ip
}

output "password" {
    value = module.jumpbox.vm-password
}