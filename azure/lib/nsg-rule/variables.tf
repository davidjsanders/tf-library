variable "nsg-rule" {
  type = object(
      {
        access                      = string
        destination-address-prefix  = string
        destination-port-range      = string
        direction                   = string
        nsg-name                    = string
        priority                    = string
        protocol                    = string
        rg-name                     = string
        rule-name                   = string
        source-port-range           = string
        source-address-prefix       = string
      }
  )
}
variable "tags" {
  type = object({})
}
