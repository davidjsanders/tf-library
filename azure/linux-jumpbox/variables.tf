variable "linux-jumpbox" {
  type = object(
      {
          admin-user              = string
          availability-set-id     = string
          boot-diags              = bool
          boot-diags-sa-uri       = string
          custom-data             = string
          delete-os-on-done       = bool
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
          os-disk-caching         = string
          os-disk-create-option   = string
          os-disk-disk-size-gb    = number
          os-disk-managed-type    = string
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
