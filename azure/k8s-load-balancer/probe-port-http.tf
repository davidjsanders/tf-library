resource "azurerm_lb_probe" "lb-probe-port-http" {
    depends_on = [
        azurerm_lb.lb
    ]

    loadbalancer_id     = azurerm_lb.lb.id
    name                = "probe-port-http"
    port                = var.load-balancer.http-be-port
    resource_group_name = var.load-balancer.rg-name
}
