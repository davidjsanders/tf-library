module "k8s-jumpbox" {
  source          = "./azure/jumpbox/"

  jumpbox         = {
    admin-user              = var.jumpbox.admin-user
    jumpbox-name            = var.jumpbox.jumpbox-name
    location                = module.k8s-resource-group.location
    machine-size            = var.jumpbox.machine-size
    nsg-id                  = module.k8s-nsg-jumpbox.id
    nsg-name                = module.k8s-nsg-jumpbox.name
    nsg-rule-number         = "1000"
    public-key              = file(var.jumpbox.public-key-file)
    rg-name                 = module.k8s-resource-group.name
    storage-account-uri     = module.k8s-jumpbox-sa.primary_blob_endpoint
    subnet-id               = module.k8s-three-tier-network.subnet-ids[2]
    storage-image-reference = format(
      "/subscriptions/%s/resourceGroups/%s/providers/Microsoft.Compute/images/%s",
      var.azure-secrets.subscription-id,
      var.jumpbox.image-rg,
      var.jumpbox.image-name
    )
  }
  tags            = var.tags
}
