location        = "East US"
rg-name         = "RG-DJS-TESTING"
public-key-file = "~/.ssh/azure_pk.pub"
tags            = {
    billing-code   = "TEST"
    business-group = "TEST"
    description    = "TEST"
    environment    = "TEST"
    target         = "TEST"
}
vnet            = {
    rg-name   = "RG-VNETS"
    vnet-name = "VNET-DJS-DOCKER-EUS"
}
subnet          = {
    rg-name     = "RG-VNETS"
    vnet-name   = "VNET-DJS-DOCKER-EUS"
    subnet-name = "SNET-DJS-DOCKER-MGMT-EUS"
}
