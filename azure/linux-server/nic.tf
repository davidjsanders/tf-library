resource "azurerm_network_interface" "nic" {
  count    = var.linux-server.server-count

  location = var.linux-server.location
  name     = upper(
    format(
      "NIC-%s-%02d%s",
      var.linux-server.server-name,
      count.index + 1,
      var.linux-server.randomizer
    )
  )

  resource_group_name = var.linux-server.rg-name

  ip_configuration {
    name = "IPv4Config"
    private_ip_address            = var.linux-server.network.private-ip-address
    private_ip_address_allocation = var.linux-server.network.private-ip-alloc
    public_ip_address_id          = var.linux-server.network.public-ip-id
    subnet_id                     = var.linux-server.network.subnet-id
  }

  tags       = var.tags
}

# module "linux-server-nic" {
#   source = "../lib/network-interface/"
#   nic = {
#     allocation = "Dynamic"
#     ip-address = ""
#     location   = var.linux-server.location
#     nic-count  = var.linux-server.nic-count
#     nic-name   = var.linux-server.server-name
#     pip-id     = var.linux-server.pip-id
#     randomizer = var.linux-server.randomizer
#     rg-name    = var.linux-server.rg-name
#     subnet-id  = var.linux-server.subnet-id
#   }
#   tags = var.tags
# }
