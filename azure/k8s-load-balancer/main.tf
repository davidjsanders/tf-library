resource "azurerm_lb" "lb" {
  location            = var.load-balancer.location
  name                = var.load-balancer.lb-name
  resource_group_name = var.load-balancer.rg-name
  sku                 = var.load-balancer.sku
  tags                = var.tags

  frontend_ip_configuration {
    name                 = var.load-balancer.fe-name
    public_ip_address_id = var.load-balancer.pip-id
  }
}

