variable "public-key-file" {}
variable "tags" {
  type = object({})
}
variable "rg" {
  type = object(
      {
          rg-name  = string
          location = string
      }
  )
}
variable "vnet" {
    type = object(
        {
            rg-name   = string
            vnet-name = string
        }
    )
}
variable "subnet" {
    type = object(
        {
            rg-name     = string
            vnet-name   = string
            subnet-name = string
        }
    )
}
variable "nic" {
  type = object(
      {
          allocation = string
          ip-address = string
          location   = string
          nic-count  = number
          nic-name   = string
          pip-id     = string
          rg-name    = string
          subnet-id  = string
      }
  )
}
variable "nsg" {
  type = object(
      {
          location          = string
          nsg-name          = string
          rg-name           = string
      }
  )
}
variable "pip" {
  type = object(
      {
          allocation-method = string
          domain-name-label = string
          ip-version        = string
          location          = string
          pip-count         = number
          pip-name          = string
          rg-name           = string
          sku               = string
      }
  )
}
variable "storage-account" {
  type = object(
      {
          account-tier     = string
          location         = string
          replication-type = string
          rg-name          = string
          sa-name          = string
      }
  )
}
variable "vm" {
    type = object(
        {
            admin-user              = string
            admin-password          = string
            avset-id                = string
            boot-diags              = bool
            boot-sa-uri             = string
            custom-data             = string
            location                = string
            name-prefix             = string
            network-interfaces      = list(string)
            disable-password-auth   = bool
            public-key              = string
            rg-name                 = string
            size                    = string
            storage-image-reference = string
            vm-count                = number
        }
    )
}
