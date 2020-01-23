module "jumpbox-nic" {
  source = "../lib/network-interface/"
  nic = {
    allocation = "Dynamic"
    ip-address = ""
    location   = var.jumpbox.location
    nic-count  = 1
    nic-name   = var.jumpbox.jumpbox-name
    pip-id     = module.jumpbox-pip.ids[0]
    randomizer = var.jumpbox.randomizer
    rg-name    = var.jumpbox.rg-name
    subnet-id  = var.jumpbox.subnet-id
  }
  tags = var.tags
}
