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
variable "firewall-allow" {
    type = object({
        fw-name = string
        ports   = list(
            object(
                {
                    port     = number
                    protocol = string
                }
            )
        )
    })
}
variable "firewall-deny" {
    type = object({
        fw-name = string
        ports   = list(
            object(
                {
                    port     = number
                    protocol = string
                }
            )
        )
    })
}
variable "google-project" {
    type = object({
        project-id = string
        region     = string
    })
}
variable "google-secrets" {
    type = object({
        credentials-filename = string
        credentials-path     = string
    })
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
        public-ip    = bool
        script       = string
        vm-hostname  = string
        vm-prefix    = string
        zone         = string
    })
}