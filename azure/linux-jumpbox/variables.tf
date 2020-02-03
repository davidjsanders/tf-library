variable "linux-jumpbox" {
  type = object(
      {
        boot-diagnostics = object({
          enable = bool
          uri    = string
        })
        location         = string
        network          = object({
          nsg-name              = string
          nsg-rule-priority     = number
          pip-alloc             = string
          pip-domain-name-label = string
          pip-sku               = string
          private-ip-address    = string
          private-ip-alloc      = string
          subnet-id             = string
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
        server           = object({
          availability-set-id = string
          machine-size        = string
          server-count        = number
          server-name         = string
        })
      }
  )
}
variable "tags" {
  type = object({})
}
