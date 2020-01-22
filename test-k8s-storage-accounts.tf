module "k8s-jumpbox-sa" {
  source          = "./azure/lib/storage-account/"
  storage-account = {
    account-tier     = "Standard"
    location         = module.k8s-resource-group.location
    replication-type = "LRS"
    rg-name          = module.k8s-resource-group.name
    sa-name          = format(
        "dasanderk8s%04d",
        random_integer.unique-sa-id.result
      )
  }
  tags            = var.tags
}
