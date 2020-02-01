module "jumpbox" {
    source = "../linux-server"
    linux-server = {
        boot-diagnostics = var.linux-jumpbox.boot-diagnostics
        location         = var.linux-jumpbox.location
        network          = {
            private-ip-address = var.linux-jumpbox.network.private-ip-address
            private-ip-alloc   = var.linux-jumpbox.network.private-ip-alloc
            public-ip-id       = azurerm_public_ip.jumpbox-pip.id
            subnet-id          = var.linux-jumpbox.network.subnet-id
        }
        os               = var.linux-jumpbox.os
        os-disk          = var.linux-jumpbox.os-disk
        randomizer       = var.linux-jumpbox.randomizer
        rg-name          = var.linux-jumpbox.rg-name
        server           = var.linux-jumpbox.server
    }
    tags         = var.tags
}