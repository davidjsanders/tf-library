resource "google_compute_firewall" "flask-firewall" {
    name    = var.firewall-allow.fw-name
    network = "default"

    dynamic "allow" {
        for_each = var.firewall-allow.ports
        iterator = port

        content {
            protocol = port.value.protocol
            ports    = [port.value.port]
        }
    }

    dynamic "deny" {
        for_each = var.firewall-deny.ports
        iterator = port

        content {
            protocol = port.value.protocol
            ports    = [port.value.port]
        }
    }
}