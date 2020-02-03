resource "azurerm_virtual_network" "vnet" {
  address_space       = var.network.address-space
  location            = var.network.location
  name                = upper(
    format(
      "VNT-%s%s",
      var.network.vnet-name,
      var.network.randomizer
    ),
  )
  resource_group_name = var.network.rg-name
  tags                = var.tags
}
