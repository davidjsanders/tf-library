variable "linux-server" {
  type = object(
      {
          admin-user              = string
          availability-set-id     = string
          boot-diags              = bool
          boot-diags-sa-uri       = string
          custom-data             = string
          location                = string
          machine-size            = string
          nic-count               = number
          pip-id                  = string
          public-key              = string
          randomizer              = string
          rg-name                 = string
          server-name             = string
          storage-image-reference = string
          subnet-id               = string
      }
  )
}
variable "tags" {
  type = object({})
}