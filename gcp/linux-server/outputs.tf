output "ip" {
    value = var.server.public-ip ? google_compute_instance.vm.network_interface.0.access_config.0.nat_ip : "No Public IP"
}

output "hostname" {
    value = var.server.public-ip ? google_compute_instance.vm.hostname : "No Public IP"
}