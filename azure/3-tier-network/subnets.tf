resource "azurerm_subnet" "subnet" {
  count = length(var.network.subnet-names)

  lifecycle {
    ignore_changes = [route_table_id, network_security_group_id]
  }
  depends_on = [
      azurerm_virtual_network.vnet
  ]

  address_prefix            = var.network.subnet-prefixes[count.index]
  name                      = upper(
    format(
      "SNT-%s%s",
      var.network.subnet-names[count.index],
      var.network.randomizer
    )
  )
  network_security_group_id = var.network.nsg-ids[count.index]
  resource_group_name       = azurerm_virtual_network.vnet.resource_group_name
  virtual_network_name      = azurerm_virtual_network.vnet.name
}
