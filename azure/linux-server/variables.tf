variable "linux-server" {
  type = object(
      {
          admin-user              = string
          admin-password          = string
          availability-set-id     = string
          boot-diags              = bool
          boot-diags-sa-uri       = string
          custom-data             = string
          data-disks              = list(object({
            caching               = string
            create-option         = string
            disk-name             = string
            disk-size-gb          = number
            managed-disk-type     = string
          }))
          delete-os-on-done       = bool
          delete-data-on-done     = bool
          disable-password-auth   = bool
          location                = string
          machine-size            = string
          network                 = object({
            private-ip-address    = string
            private-ip-alloc      = string
            public-ip-id          = string
            subnet-id             = string
          })
          os-disk                 = object({
            caching               = string
            create-option         = string
            disk-name             = string
            disk-size-gb          = number
            managed-disk-type     = string
          })
          pip-id                  = string
          public-key              = string
          randomizer              = string
          rg-name                 = string
          server-count            = number
          server-name             = string
          storage-image-reference = string
          subnet-id               = string
      }
  )
}
variable "tags" {
  type = object({})
}
