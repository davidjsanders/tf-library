variable "jumpbox" {
  type = object(
      {
          admin-user              = string
          availability-set-id     = string
          boot-diags              = bool
          boot-diags-sa-uri       = string
          custom-data             = string
          jumpbox-name            = string
          location                = string
          machine-size            = string
          nsg-id                  = string
          nsg-name                = string
          nsg-rule-number         = string
          public-key              = string
          randomizer              = string
          rg-name                 = string
          storage-image-reference = string
          subnet-id               = string
      }
  )
}
variable "tags" {
  type = object({})
}
