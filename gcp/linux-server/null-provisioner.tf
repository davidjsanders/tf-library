resource "null_resource" "vm-provisioner" {
    triggers = {
        vm-id          = google_compute_instance.vm.id
        vm-user        = var.server.admin-user
        vm-keyfile     = file(var.server.keyfile)
        disk-id        = join(",", google_compute_disk.datadisk.*.id)
        disk-attach-id = join(",", google_compute_attached_disk.datadisk-attach.*.id)
        nic-ip-address = google_compute_instance.vm.network_interface.0.access_config.0.nat_ip
    }

    connection {
        host         = self.triggers.nic-ip-address
        type         = "ssh"
        user         = self.triggers.vm-user
        private_key  = self.triggers.vm-keyfile
    }
    provisioner "file" {
        content = templatefile(
            "${path.module}/templates/bootstrap.sh",
            {
                disks = [for d in var.datadisk: {
                    device = format(
                        "/dev/sd%s",
                        substr("bcdefghij", index(var.datadisk, d), 1)
                    ),
                    mountpoint = d.mountpoint
                }]
            }
        )
        destination = "~/bootstrap.sh"
    }

    provisioner "remote-exec" {
        inline = [<<EOF
chmod +x ~/bootstrap.sh
sudo ~/bootstrap.sh
echo "Done.",
EOF
        ]
    }

    provisioner "remote-exec" {
        when = destroy
        inline = [
            "echo 'Destroying :) '"
        ]
    }
}