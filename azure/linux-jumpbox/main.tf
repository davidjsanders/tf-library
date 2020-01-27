module "jumpbox" {
    source = "../linux-server"
    linux-server = {
        admin-user              = var.linux-jumpbox.admin-user
        availability-set-id     = var.linux-jumpbox.availability-set-id
        boot-diags              = var.linux-jumpbox.boot-diags
        boot-diags-sa-uri       = var.linux-jumpbox.boot-diags-sa-uri
        custom-data             = var.linux-jumpbox.custom-data
        delete-os-on-done       = var.linux-jumpbox.delete-os-on-done
        delete-data-on-done     = var.linux-jumpbox.delete-data-on-done
        disable-password-auth   = var.linux-jumpbox.disable-password-auth
        location                = var.linux-jumpbox.location
        machine-size            = var.linux-jumpbox.machine-size
        network                 = {
            private-ip-address = var.linux-jumpbox.network.private-ip-address
            private-ip-alloc   = var.linux-jumpbox.network.private-ip-alloc
            public-ip-id       = azurerm_public_ip.jumpbox-pip.id
            subnet-id          = var.linux-jumpbox.network.subnet-id
        }
        os-disk-caching         = var.linux-jumpbox.os-disk-caching
        os-disk-create-option   = var.linux-jumpbox.os-disk-create-option
        os-disk-disk-size-gb    = var.linux-jumpbox.os-disk-disk-size-gb
        os-disk-managed-type    = var.linux-jumpbox.os-disk-managed-type
        public-key              = var.linux-jumpbox.public-key
        randomizer              = var.linux-jumpbox.randomizer
        rg-name                 = var.linux-jumpbox.rg-name
        server-count            = 1
        server-name             = var.linux-jumpbox.server-name
        storage-image-reference = var.linux-jumpbox.storage-image-reference
    }
    tags         = var.tags
}