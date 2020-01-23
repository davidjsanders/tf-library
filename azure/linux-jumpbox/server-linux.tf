module "jumpbox-server" {
  source = "../linux-server/"

  linux-server = {
    admin-user              = var.jumpbox.admin-user
    server-name             = var.jumpbox.jumpbox-name
    location                = var.jumpbox.location
    machine-size            = var.jumpbox.machine-size
    nsg-id                  = var.jumpbox.nsg-id
    nsg-name                = var.jumpbox.nsg-name
    nsg-rule-number         = var.jumpbox.nsg-rule-number
    pip-id                  = module.jumpbox-pip.ids[0]
    public-key              = var.jumpbox.public-key
    randomizer              = var.jumpbox.randomizer
    rg-name                 = var.jumpbox.rg-name
    storage-account-uri     = var.jumpbox.storage-account-uri
    storage-image-reference = var.jumpbox.storage-image-reference
    subnet-id               = var.jumpbox.subnet-id
  }
  tags         = var.tags
}
