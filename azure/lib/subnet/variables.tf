variable "subnet" {
  type = object(
      {
        address_prefix = string
        subnet-name    = string
        rg-name        = string
        vnet-name      = string
        nsg-id         = string
      }
  )
}
