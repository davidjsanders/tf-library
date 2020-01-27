resource "azurerm_public_ip" "jumpbox-pip" {
  allocation_method   = var.linux-jumpbox.network.pip-alloc
  domain_name_label   = var.linux-jumpbox.network.pip-domain-name-label
  location            = var.linux-jumpbox.location
  name                = format(
    "PIP-%s%s",
    var.linux-jumpbox.server-name,
    var.linux-jumpbox.randomizer
  )
  resource_group_name = var.linux-jumpbox.rg-name
  sku                 = var.linux-jumpbox.network.pip-sku
  tags                = var.tags
}
