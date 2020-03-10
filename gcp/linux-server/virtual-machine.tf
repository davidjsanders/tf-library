resource "google_compute_instance" "vm" {
    depends_on = [
    ]
    lifecycle {
        ignore_changes = [attached_disk]
    }

    boot_disk {
        auto_delete = var.server.delete-osd
        initialize_params {
            image = "debian-cloud/debian-9"
        }
    }
    hostname                = lower(format(
        "%s",
        var.server.vm-hostname
    ))
    labels                  = var.labels
    machine_type            = var.server.machine-type
    metadata                = {
        ssh-keys = format(
            "%s:%s",
            var.server.admin-user,
            file(var.server.pub-keyfile)
        )
    }
    metadata_startup_script = var.server.script
    name = format(
        "%s-%s",
        var.server.vm-prefix,
        random_id.instance-id.hex
    )
    network_interface {
        network = "default"

        dynamic "access_config" {
            for_each = [for i in range(0, var.server.public-ip == false ? 0 : 1) : ""]
            iterator = theit
            content {
                network_tier = "PREMIUM"
            }
        }
    }
    zone                    = var.server.zone
}
