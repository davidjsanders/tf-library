module "test-storage-account" {
  source          = "./lib-storage-account/"
  storage-account = {
    account-tier     = "Standard"
    location         = module.test-resource-group.location
    replication-type = "LRS"
    rg-name          = module.test-resource-group.name
    sa-name          = format(
        "dasander%04d",
        random_integer.unique-sa-id.result
      )
  }
  tags            = var.tags
}
