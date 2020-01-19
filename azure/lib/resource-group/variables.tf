variable "rg" {
  type = object(
      {
          rg-name  = string
          location = string
      }
  )
}
variable "tags" {
  type = object({})
}
