module "linux-jumpbox" {
    source = "../linux-server"

    labels   = var.labels
    randoms  = var.randoms
    server = {
        admin-user   = var.server.admin-user
        delete-osd   = var.server.delete-osd
        keyfile      = var.server.keyfile
        machine-type = var.server.machine-type
        pub-keyfile  = var.server.pub-keyfile
        public-ip    = true
        script       = var.server.script
        vm-hostname  = var.server.vm-hostname
        vm-prefix    = var.server.vm-prefix
        zone         = var.server.zone
    }
}