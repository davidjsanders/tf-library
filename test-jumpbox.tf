module "jumpbox" {
  source          = "./azure/jumpbox/"

  jumpbox         = {
    admin-user              = var.jumpbox.admin-user
    jumpbox-name            = var.jumpbox.jumpbox-name
    location                = module.test-resource-group.location
    machine-size            = var.jumpbox.machine-size
    nsg-id                  = module.test-nsg.id
    nsg-name                = module.test-nsg.name
    nsg-rule-number         = "1000"
    public-key              = file(var.jumpbox.public-key-file)
    rg-name                 = module.test-resource-group.name
    storage-account-uri     = data.azurerm_storage_account.storage-account.primary_blob_endpoint
    subnet-id               = module.three-tier-network.subnet-ids[0]
    storage-image-reference = format(
      "/subscriptions/%s/resourceGroups/%s/providers/Microsoft.Compute/images/%s",
      var.azure-secrets.subscription-id,
      var.jumpbox.image-rg,
      var.jumpbox.image-name
    )
  }
  tags            = var.tags
}
