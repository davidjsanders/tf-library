variable "nsg" {
  type = object(
      {
          location          = string
          nsg-name          = string
          rg-name           = string
      }
  )
}
variable "tags" {
  type = object({})
}
