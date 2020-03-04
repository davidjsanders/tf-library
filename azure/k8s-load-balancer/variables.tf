variable "load-balancer" {
    type = object({
        be-name       = string
        fe-name       = string
        http-be-port  = number
        http-fe-port  = number
        https-be-port = number
        https-fe-port = number
        lb-name       = string
        location      = string
        nics          = list(string)
        pip-id        = string
        rg-name       = string
        sku           = string
    })
}

variable "tags" {
    type = map(any)
}