resource "azurerm_network_security_rule" "nsg-rule" {
  access                      = var.nsg-rule.access
  direction                   = var.nsg-rule.direction
  destination_address_prefix  = var.nsg-rule.destination-address-prefix
  destination_port_range      = var.nsg-rule.destination-port-range
  name                        = upper(
    format(
      "NSR-%s",
      var.nsg-rule.rule-name
    )
  )
  priority                    = var.nsg-rule.priority
  protocol                    = var.nsg-rule.protocol
  source_port_range           = var.nsg-rule.source-port-range
  source_address_prefix       = var.nsg-rule.source-address-prefix
  resource_group_name         = var.nsg-rule.rg-name
  network_security_group_name = var.nsg-rule.nsg-name
}

