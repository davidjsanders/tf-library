variable "destination-disk" {
    type = object({
        disk-name            = string
        encryption-settings  = map(any)
        location             = string
        rg-name              = string
        storage-account-type = string
    })
}
variable "randomizer" { default = "" }
variable "source-disk" {
    type = object({
        disk-name = string
        rg-name   = string
    })
}
variable "tags" {
    type = map(any)
}