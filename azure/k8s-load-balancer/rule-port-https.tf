resource "azurerm_lb_rule" "k8s-lb-rule-https" {
    depends_on = [
        azurerm_lb.lb,
        azurerm_lb_backend_address_pool.lb-bepool
    ]

    backend_port        = var.load-balancer.https-be-port
    frontend_port       = var.load-balancer.https-fe-port
    loadbalancer_id     = azurerm_lb.lb.id
    name                = "https"
    protocol            = "Tcp"
    resource_group_name = var.load-balancer.rg-name

    backend_address_pool_id        = azurerm_lb_backend_address_pool.lb-bepool.id
    frontend_ip_configuration_name = azurerm_lb.lb.frontend_ip_configuration.name
    probe_id                       = azurerm_lb_probe.lb-probe-port-https.id
}
