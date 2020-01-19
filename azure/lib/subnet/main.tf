resource "azurerm_subnet" "subnet" {
  address_prefix = var.subnet.address_prefix
  lifecycle {
    ignore_changes = [network_security_group_id]
  }

  name = format(
    "SNET-%s",
    var.subnet.subnet-name
  )
  resource_group_name       = var.subnet.rg-name
  virtual_network_name      = var.subnet.vnet-name
  network_security_group_id = var.subnet.nsg-id
}
