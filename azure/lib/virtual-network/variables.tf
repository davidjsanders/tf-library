variable "vnet" {
  type = object(
      {
        address-space = list(string)
        location      = string
        randomizer    = string
        rg-name       = string
        vnet-name     = string
      }
  )
}
variable "tags" {
  type = object({})
}
