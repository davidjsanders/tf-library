variable "linux-jumpbox" {
  type = object(
      {
          admin-user              = string
          availability-set-id     = string
          boot-diags              = bool
          boot-diags-sa-uri       = string
          custom-data             = string
          delete-data-on-done     = bool
          disable-password-auth   = bool
          location                = string
          machine-size            = string
          network                 = object({
            pip-alloc             = string
            pip-domain-name-label = string
            pip-sku               = string
            private-ip-address    = string
            private-ip-alloc      = string
            subnet-id             = string
          })
          os-disk                 = object({
            caching        = string
            create-option  = string
            disk-size-gb   = number
            managed-type   = string
            delete-on-done = bool
          })
          public-key              = string
          randomizer              = string
          rg-name                 = string
          server-name             = string
          storage-image-reference = string
      }
  )
}
variable "tags" {
  type = object({})
}
