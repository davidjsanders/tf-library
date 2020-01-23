variable "linux-server" {
  type = object(
      {
          admin-user              = string
          jumpbox-name            = string
          location                = string
          machine-size            = string
          nsg-id                  = string
          nsg-name                = string
          nsg-rule-number         = string
          pip-id                  = string
          public-key              = string
          randomizer              = string
          rg-name                 = string
          storage-account-uri     = string
          storage-image-reference = string
          subnet-id               = string
      }
  )
}
variable "tags" {
  type = object({})
}
