module "jumpbox-vm" {
  source         = "../lib/virtual-machine/"

  tags           = var.tags
  vm             = {
    admin-user              = var.jumpbox.admin-user
    admin-password          = random_password.password.result
    avset-id                = ""
    boot-diags              = true
    boot-sa-uri             = var.jumpbox.storage-account-uri
    custom-data             = ""
    disable-password-auth   = true
    location                = var.jumpbox.location
    name-prefix             = var.jumpbox.jumpbox-name
    network-interfaces      = module.jumpbox-nic.ids
    public-key              = var.jumpbox.public-key
    rg-name                 = var.jumpbox.rg-name
    size                    = var.jumpbox.machine-size
    storage-image-reference = var.jumpbox.storage-image-reference
    vm-count                = 1
  }
  vm-os-disk     = {
    disk-name           = var.jumpbox.jumpbox-name
    caching             = "ReadWrite"
    create-option       = "FromImage"
    disk-type           = "Premium_LRS"
    delete-on-terminate = true
  }
  vm-data-disk   = {
    disk-count          = 0
    disk-prefix         = var.jumpbox.jumpbox-name
    caching             = "ReadWrite"
    create-option       = "Empty"
    disk-type           = "Premium_LRS"
    disk-size-gb        = 50
    delete-on-terminate = true
  }
}
