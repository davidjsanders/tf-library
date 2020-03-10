resource "google_compute_firewall" "flask-firewall" {
    name    = var.firewall-values.firewall-name
    network = var.firewall-values.network-name

    dynamic "allow" {
        for_each = var.firewall-values.allow-ports
        iterator = port

        content {
            protocol = port.value.protocol
            ports    = [port.value.port]
        }
    }

    dynamic "deny" {
        for_each = var.firewall-values.deny-ports
        iterator = port

        content {
            protocol = port.value.protocol
            ports    = [port.value.port]
        }
    }
}