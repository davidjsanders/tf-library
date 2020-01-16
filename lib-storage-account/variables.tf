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
