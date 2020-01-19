output "ip" {
    value = module.jumpbox.private-ip
}

output "public-ip" {
    value = module.jumpbox.public-ip
}
