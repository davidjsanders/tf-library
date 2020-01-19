resource "azurerm_network_interface" "nic" {
  count    = var.nic.nic-count
  location = var.nic.location
  name     = format(
    "%s-%02d",
    var.nic.nic-name,
    count.index + 1
  )

  resource_group_name = var.nic.rg-name

  ip_configuration {
    name = format(
      "%s-IPCONFIG-%02d",
      var.nic.nic-name,
      count.index + 1
    )
    private_ip_address_allocation = var.nic.allocation
    private_ip_address            = var.nic.ip-address
    public_ip_address_id          = var.nic.pip-id
    subnet_id                     = var.nic.subnet-id
  }

  tags       = var.tags
}
