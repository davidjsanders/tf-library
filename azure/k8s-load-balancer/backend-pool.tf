resource "azurerm_lb_backend_address_pool" "lb-bepool" {
    depends_on = [
        azurerm_lb.lb
    ]

    resource_group_name = var.load-balancer.rg-name
    loadbalancer_id     = azurerm_lb.lb.id
    name                = var.load-balancer.be-name
}
