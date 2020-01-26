module "jumpbox-server" {
  source = "../linux-server/"

  linux-server = {
    admin-user              = var.jumpbox.admin-user
    availability-set-id     = var.jumpbox.availability-set-id
    boot-diags              = var.jumpbox.boot-diags
    boot-diags-sa-uri       = var.jumpbox.boot-diags-sa-uri
    custom-data             = var.jumpbox.custom-data
    location                = var.jumpbox.location
    machine-size            = var.jumpbox.machine-size
    nic-count               = 1
    pip-id                  = module.jumpbox-pip.ids[0]
    public-key              = var.jumpbox.public-key
    randomizer              = var.jumpbox.randomizer
    rg-name                 = var.jumpbox.rg-name
    server-name             = var.jumpbox.jumpbox-name
    storage-image-reference = var.jumpbox.storage-image-reference
    subnet-id               = var.jumpbox.subnet-id
  }
  tags         = var.tags
}
