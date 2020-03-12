variable "network-info" {
    type = object({
        auto-create-subnets = bool
        network-name        = string
        subnets             = list(object({
            cidr-block  = string
            region      = string
            subnet-name = string
        }))
    })
}
