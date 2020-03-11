output "hostname" {
    value = module.linux-jumpbox.*.hostname[0]
}

output "ip" {
    value = module.linux-jumpbox.*.ip[0]
}

output "private-ip" {
    value = module.linux-jumpbox.*.private-ip[0]
}

output "self-link" {
    value = module.linux-jumpbox.*.self-link[0]
}