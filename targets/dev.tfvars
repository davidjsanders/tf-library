location = "East US"
network = {
    rg-name = "RG-ENGINEERING"
    vnet-name = "TEST-VNET"
    subnet-name = "TEST-SUBNET"
}
tags = {
    billing-code   = "TEST"
    business-group = "TEST"
    description    = "TEST"
    environment    = "TEST"
    target         = "TEST"
}
vm = {
    rg-name        = "RG-ENGINEERING"
    avset-id       = ""
    vm-count       = 1
    name-prefix    = "test-vm"
    size           = "Standard_DS1_v2"
    boot-diags     = false
    boot-sa-uri    = ""
    custom-data    = ""
    admin-user     = "azadmin"
    admin-password = "s1mple$Testing"
    public-key     = ""
    password-auth  = false
    network-interfaces = [
        "/subscriptions/54dd1e30-b249-43a1-a46e-9a1c40dff2cc/resourceGroups/RG-ENGINEERING/providers/Microsoft.Network/networkInterfaces/test-nic"
    ]
}
vm-os-disk = {
    disk-name           = "osd-disk"
    caching             = "ReadWrite"
    create-option       = "FromImage"
    disk-type           = "Premium_LRS"
    delete-on-terminate = true
}
vm-data-disk = {
    disk-count          = 0
    disk-prefix         = "data-disk"
    caching             = "ReadWrite"
    create-option       = "FromImage"
    disk-type           = "Premium_LRS"
    delete-on-terminate = true
}
