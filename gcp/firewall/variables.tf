variable "firewall-values" {
    type = object({
        allow-ports   = list(object({
            port     = number
            protocol = string
        }))
        deny-ports   = list(object({
            port     = number
            protocol = string
        }))
        destinations  = list(string)
        firewall-name = string
        network-name  = string
    })
}