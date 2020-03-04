resource "azurerm_lb_probe" "lb-probe-port-https" {
    depends_on = [
        azurerm_lb.lb
    ]

    loadbalancer_id     = azurerm_lb.lb.id
    name                = "probe-port-https"
    port                = var.load-balancer.https-be-port
    resource_group_name = var.load-balancer.rg-name
}
