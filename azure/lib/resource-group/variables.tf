variable "rg" {
  type = object(
      {
        randomizer = string
        rg-name    = string
        location   = string
      }
  )
}
variable "tags" {
  type = object({})
}
