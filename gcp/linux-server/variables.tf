variable "labels" {
    type = map(string)
}
variable "randoms" {
    type = object({
        instance-id = string
        host-id     = string
    })
}
variable "server" {
    type = object({
        admin-user   = string
        delete-osd   = bool
        keyfile      = string
        machine-type = string
        network      = string
        pub-keyfile  = string
        public-ip    = bool
        script       = string
        subnetwork   = string
        vm-count     = number
        vm-hostname  = string
        vm-prefix    = string
        zone         = string
    })
}