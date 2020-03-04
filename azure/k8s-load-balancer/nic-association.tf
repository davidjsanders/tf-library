resource "azurerm_network_interface_backend_address_pool_association" "lb-assoc" {
    count = length(var.load-balancer.nics)

    depends_on = [
        azurerm_lb.lb,
        azurerm_lb_backend_address_pool.lb-bepool
    ]

    backend_address_pool_id = azurerm_lb_backend_address_pool.lb-bepool.id
    ip_configuration_name   = "IPv4"
    network_interface_id    = var.load-balancer.nics[count.index]
}
