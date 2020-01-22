variable "tags" {
  type = object({})
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
            disk-size-gb        = number
            delete-on-terminate = bool
        }
    )
}
