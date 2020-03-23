output "osname" {
    value = google_compute_instance.vm.*.name
}

output "hostname" {
    value = var.server.public-ip ? google_compute_instance.vm.*.hostname : ["No Public IP"]
}

output "ip" {
    value = var.server.public-ip ? google_compute_instance.vm.*.network_interface.0.access_config.0.nat_ip : ["No Public IP"]
}

output "private-ip" {
    value = google_compute_instance.vm.*.network_interface.0.network_ip
}

output "network-interfaces" {
    value = google_compute_instance.vm.*.network_interface
}

output "self-link" {
    value = google_compute_instance.vm.*.self_link
}