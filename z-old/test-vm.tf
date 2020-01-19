module "test-vm" {
  source         = "./virtual-machine/"

  tags           = var.tags
  vm             = {
    admin-user              = "azadmin"
    admin-password          = random_password.password.result
    avset-id                = ""
    boot-diags              = true
    boot-sa-uri             = module.test-storage-account.primary_blob_endpoint
    custom-data             = ""
    disable-password-auth   = true
    location                = module.test-resource-group.location
    name-prefix             = "test-vm"
    network-interfaces      = module.test-nic.ids
    public-key              = var.azure-secrets.public-key
    rg-name                 = module.test-resource-group.name
    size                    = "Standard_DS1_v2"
    storage-image-reference = format(
      "/subscriptions/%s/resourceGroups/%s/providers/Microsoft.Compute/images/%s",
      var.azure-secrets.subscription-id,
      "RG-ENGINEERING",
      "K8S-UBUNTU-1804-20-01-14"
    )
    vm-count                = 1
  }
  vm-os-disk     = {
    disk-name           = "osd-disk"
    caching             = "ReadWrite"
    create-option       = "FromImage"
    disk-type           = "Premium_LRS"
    delete-on-terminate = true
  }
  vm-data-disk   = {
    disk-count          = 0
    disk-prefix         = "data-disk"
    caching             = "ReadWrite"
    create-option       = "FromImage"
    disk-type           = "Premium_LRS"
    delete-on-terminate = true
  }
}
