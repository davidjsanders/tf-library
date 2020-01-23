variable "pip" {
  type = object(
      {
          allocation-method = string
          domain-name-label = string
          ip-version        = string
          location          = string
          pip-count         = number
          pip-name          = string
          randomizer        = string
          rg-name           = string
          sku               = string
      }
  )
}
variable "tags" {
  type = object({})
}
