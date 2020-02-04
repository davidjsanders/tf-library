resource "null_resource" "provisioner" {
    depends_on = [data.azurerm_public_ip.jumpbox-pip-data]

    connection {
        host         = data.azurerm_public_ip.jumpbox-pip-data.ip_address
        type         = "ssh"
        user         = var.linux-jumpbox.os.admin-user
        private_key  = file(var.linux-jumpbox.os.private-key-filename)
    }

    provisioner "file" {
        source      = var.linux-jumpbox.os.private-key-filename
        destination = format(
            "/home/%s/.ssh/id_rsa",
            var.linux-jumpbox.os.admin-user
        )
    }

    provisioner "remote-exec" {
        inline = [
            "chmod 0600 ~/.ssh/id_rsa",
            "echo 'Done.'",
        ]
    }

}
