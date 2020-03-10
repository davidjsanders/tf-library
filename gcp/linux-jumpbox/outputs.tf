output "hostname" {
    value = module.linux-jumpbox[0].hostname
}

output "ip" {
    value = module.linux-jumpbox[0].ip
}

output "private-ip" {
    value = module.linux-jumpbox[0].private-ip
}

output "self-link" {
    value = module.linux-jumpbox[0].self-link
}