variable "linux-server" {
  type = object(
      {
          admin-user              = string
          location                = string
          machine-size            = string
          pip-id                  = string
          public-key              = string
          randomizer              = string
          rg-name                 = string
          server-count            = number
          server-name             = string
          storage-account-uri     = string
          storage-image-reference = string
          subnet-id               = string
      }
  )
}
variable "tags" {
  type = object({})
}
