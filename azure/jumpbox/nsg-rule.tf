module "jumpbox-ssh-rule" {
  source = "../lib/nsg-rule/"
  nsg-rule = {
    access                      = "Allow"
    direction                   = "Inbound"
    destination-address-prefix  = module.jumpbox-nic.ips[0]
    destination-port-range      = "22"
    nsg-name                    = var.jumpbox.nsg-name
    priority                    = var.jumpbox.nsg-rule-number
    protocol                    = "Tcp"
    randomizer                  = var.jumpbox.randomizer
    source-port-range           = "*"
    source-address-prefix       = "Internet"
    rg-name                     = var.jumpbox.rg-name
    rule-name                   = format(
      "Allow-%s-SSH",
      var.jumpbox.jumpbox-name
    )
  }
  tags = var.tags
}
