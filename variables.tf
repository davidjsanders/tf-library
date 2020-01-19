variable "location" {}
variable "rg-name" {}
variable "public-key-file" {}
variable "storage-account-name" {}
variable "storage-account-rg" {}
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
variable "subnet" {
    type = object(
        {
            rg-name     = string
            vnet-name   = string
            subnet-name = string
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
