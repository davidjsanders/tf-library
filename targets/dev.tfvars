location             = "East US"
rg-name              = "RG-DJS-TESTING"
public-key-file      = "~/.ssh/azure-pk.pub"
storage-account = {
    rg-name   = "RG-STORAGE-ACCOUNTS"
    sa-name   = "dasandervms"
}
subnet               = {
    address-prefix = "10.60.1.0/25"
    rg-name        = "RG-VNETS"
    vnet-name      = "VNET-DJS-DOCKER-EUS"
    subnet-name    = "SNET-DJS-TESTING"
    nsg-id         = "tbd"
}
jumpbox              = {
    admin-user      = "jumper"
    image-name      = "K8S-UBUNTU-1804-20-01-14"
    image-rg        = "RG-ENGINEERING"
    jumpbox-name    = "david-test"
    machine-size    = "Standard_DS1_v2"
    public-key-file = "~/.ssh/azure-pk.pub"
}
tags                 = {
    billing-code   = "TEST"
    business-group = "TEST"
    description    = "TEST"
    environment    = "TEST"
    target         = "TEST"
}
vnet                 = {
    rg-name   = "RG-VNETS"
    vnet-name = "VNET-DJS-DOCKER-EUS"
}
