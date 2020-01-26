module "linux-server-vm" {
  source         = "../lib/virtual-machine/"

  tags           = var.tags
  vm             = {
    admin-user              = var.linux-server.admin-user
    admin-password          = random_password.password.result
    avset-id                = var.linux-server.availability-set-id
    boot-diags              = var.linux-server.boot-diags
    boot-sa-uri             = var.linux-server.boot-diags-sa-uri
    custom-data             = var.linux-server.custom-data
    disable-password-auth   = true
    location                = var.linux-server.location
    name-prefix             = var.linux-server.server-name
    network-interfaces      = module.linux-server-nic.ids
    public-key              = var.linux-server.public-key
    randomizer              = var.linux-server.randomizer
    rg-name                 = var.linux-server.rg-name
    size                    = var.linux-server.machine-size
    storage-image-reference = var.linux-server.storage-image-reference
    vm-count                = 1
  }
  vm-os-disk     = {
    disk-name           = var.linux-server.server-name
    caching             = "ReadWrite"
    create-option       = "FromImage"
    disk-type           = "Premium_LRS"
    delete-on-terminate = true
  }
  vm-data-disk   = {
    disk-count          = 0
    disk-prefix         = var.linux-server.server-name
    caching             = "ReadWrite"
    create-option       = "Empty"
    disk-type           = "Premium_LRS"
    disk-size-gb        = 50
    delete-on-terminate = true
  }
}
