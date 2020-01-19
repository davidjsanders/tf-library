variable "nic" {
  type = object(
      {
          allocation = string
          ip-address = string
          location   = string
          nic-count  = number
          nic-name   = string
          pip-id     = string
          rg-name    = string
          subnet-id  = string
      }
  )
}
variable "tags" {
  type = object({})
}
