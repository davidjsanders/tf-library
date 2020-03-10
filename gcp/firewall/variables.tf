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
