variable "client-id" {}
variable "client-secret" {}
variable "tenant-id" {}
variable "subscription-id" {}
variable "public-key" {}

# variable "azure-secrets" {
#     type = object(
#         {
#             client-id       = string
#             client-secret   = string
#             tenant-id       = string
#             subscription-id = string
#             public-key      = string
#         }
#     )
# }
variable "location" {}
variable "network" {
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
variable "vm" {
    type = object(
        {
            rg-name        = string
            avset-id       = string
            vm-count       = number
            size           = string
            name-prefix    = string
            boot-diags     = bool
            boot-sa-uri    = string
            custom-data    = string
            admin-user     = string
            admin-password = string
            password-auth  = bool
            public-key     = string
            network-interfaces = list(string)
        }
    )
}
variable "vm-image" {
    type = object(
        {
            subscription-id = string
            rg-name         = string
            id              = string
        }
    )
}
variable "vm-os-disk" {
    type = object(
        {
            disk-name           = string
            caching             = string
            create-option       = string
            disk-type           = string
            delete-on-terminate = bool
        }
    )
}
variable "vm-data-disk" {
    type = object(
        {
            disk-count          = number
            disk-prefix         = string
            caching             = string
            create-option       = string
            disk-type           = string
            delete-on-terminate = bool
        }
    )
}

# image          = object(
#     {
#         subscription-id = string
#         image-rg-name   = string
#         image-id        = string
#     }
# )
# os-disk        = object(
#     {
#         disk-name           = string
#         caching             = string
#         create-option       = string
#         disk-type           = string
#         delete-on-terminate = bool
#     }
# )
# data-disk     = object(
#     {
#         disk-name           = string
#         caching             = string
#         create-option       = string
#         disk-type           = string
#         delete-on-terminate = bool
#     }
# )
