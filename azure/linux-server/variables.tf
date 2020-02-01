variable "linux-server" {
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
            private-ip-address    = string
            private-ip-alloc      = string
            public-ip-id          = string
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
          server-count            = number
          server-name             = string
          storage-image-reference = string
      }
  )
}
variable "tags" {
  type = object({})
}
