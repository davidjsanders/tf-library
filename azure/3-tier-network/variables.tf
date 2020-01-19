variable "network" {
  type = object(
      {
        address-space   = list(string)
        location        = string
        nsg-ids         = list(string)
        rg-name         = string
        subnet-prefixes = list(string)
        subnet-names    = list(string)
        vnet-name       = string
      }
  )
}
variable "tags" {
  type = object({})
}