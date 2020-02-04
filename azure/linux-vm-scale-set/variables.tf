variable "scale-set" {
  type = object(
      {
        boot-diagnostics = object({
          enable = bool
          uri    = string
        })
        data-disk        = list(
          object({
            caching           = string
            create_option     = string
            disk_size_gb      = number
            lun               = number
            managed_disk_type = string
          })
        )
        location         = string
        network          = object({
          lb-backend-address-pool-ids = list(string)
          lb-inbound-nat-rules-ids    = list(string)
          private-ip-address          = string
          private-ip-alloc            = string
          public-ip-id                = string
          subnet-id                   = string
        })
        os               = object({
          admin-user              = string
          custom-data             = string
          disable-password-auth   = bool
          hostname                = string
          private-key-filename    = string
          public-key              = string
          storage-image-reference = string
        })
        os-disk          = object({
          caching        = string
          create-option  = string
          disk-size-gb   = number
          managed-type   = string
          delete-on-done = bool
        })
        randomizer       = string
        rg-name          = string
        scale-set-name   = string
        server           = object({
          capacity            = number
          machine-size        = string
          server-name         = string
          tier                = string
          upgrade-policy-mode = string
        })
      }
  )
}
variable "tags" {
  type = object({})
}
