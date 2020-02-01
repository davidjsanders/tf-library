resource "azurerm_network_security_rule" "nsg-rule" {
  access                      = "Allow"
  direction                   = "Inbound"
  destination_address_prefix  = module.jumpbox.nic-private-ips[0]
  destination_port_range      = "22"
  name                        = upper(
    format(
      "NSR-%s-SSH%s",
      var.linux-jumpbox.server.server-name,
      var.linux-jumpbox.randomizer
    )
  )
  priority                    = var.linux-jumpbox.network.nsg-rule-priority
  protocol                    = "Tcp"
  source_port_range           = "*"
  source_address_prefix       = "Internet"
  resource_group_name         = var.linux-jumpbox.rg-name
  network_security_group_name = var.linux-jumpbox.network.nsg-name
}

