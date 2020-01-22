output "ip" {
    value = module.k8s-jumpbox.private-ip
}

output "pip-name" {
    value = module.k8s-jumpbox.pip-name
}

# output "public-ip" {
#     value = data.azurerm_public_ip.provisioned-pip.ip_address
# }