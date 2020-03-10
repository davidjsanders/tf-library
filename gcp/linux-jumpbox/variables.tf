variable "datadisk" {
    type = list(object({
        block_size_bytes = number
        disk-name        = string
        disk-size-in-gb  = number
        disk-type        = string
        mountpoint       = string
        zone             = string
    }))
}
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
        pub-keyfile  = string
        script       = string
        vm-hostname  = string
        vm-prefix    = string
        zone         = string
    })
}