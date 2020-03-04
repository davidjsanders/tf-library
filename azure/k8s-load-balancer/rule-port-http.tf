resource "azurerm_lb_rule" "k8s-lb-rule-http" {
    depends_on = [
        azurerm_lb.lb,
        azurerm_lb_backend_address_pool.lb-bepool
    ]

    backend_port        = var.load-balancer.http-be-port
    frontend_port       = var.load-balancer.http-fe-port
    loadbalancer_id     = azurerm_lb.lb.id
    name                = "http"
    protocol            = "Tcp"
    resource_group_name = var.load-balancer.rg-name

    backend_address_pool_id        = azurerm_lb_backend_address_pool.lb-bepool.id
    frontend_ip_configuration_name = var.load-balancer.fe-name
    probe_id                       = azurerm_lb_probe.lb-probe-port-http.id
}
