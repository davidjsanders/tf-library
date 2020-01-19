variable "location" {}
variable "rg-name" {}
variable "public-key-file" {}
variable "azure-secrets" {
    type = object(
        {
            client-id       = string
            client-secret   = string
            tenant-id       = string
            subscription-id = string
            public-key      = string
        }
    )
}
variable "jumpbox" {
  type = object(
      {
          admin-user      = string
          image-name      = string
          image-rg        = string
          jumpbox-name    = string
          machine-size    = string
          public-key-file = string
      }
  )
}
variable "storage-account" {
    type = object(
        {
            rg-name = string
            sa-name = string
        }
    )
}
variable "subnet" {
    type = object(
        {
            address-prefix = string
            rg-name        = string
            vnet-name      = string
            subnet-name    = string
            nsg-id         = string
        }
    )
}
variable "tags" {
  type = object(
      {
          billing-code   = string
          business-group = string
          description    = string
          environment    = string
          target         = string
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
