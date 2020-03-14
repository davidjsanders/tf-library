module "linux-jumpbox" {
    source = "../linux-server"

    labels   = var.labels
    randoms  = var.randoms
    server = {
        admin-user   = var.server.admin-user
        delete-osd   = var.server.delete-osd
        image-id     = var.server.image-id
        keyfile      = var.server.keyfile
        machine-type = var.server.machine-type
        network      = var.server.network
        pub-keyfile  = var.server.pub-keyfile
        public-ip    = true
        script       = var.server.script
        subnetwork   = var.server.subnetwork
        vm-count     = 1
        vm-hostname  = var.server.vm-hostname
        vm-prefix    = var.server.vm-prefix
        zone         = var.server.zone
    }
}