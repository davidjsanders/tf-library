output "network-self-link" {
    value = google_compute_network.vnet.self_link
}

output "subnet-self-links" {
    value = google_compute_subnetwork.subnets.*.self_link
}