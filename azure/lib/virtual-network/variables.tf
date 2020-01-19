variable "vnet" {
  type = object(
      {
        address-space = list(string)
        location      = string
        rg-name       = string
        vnet-name     = string
        nsg-id        = string
      }
  )
}
variable "tags" {
  type = object({})
}
