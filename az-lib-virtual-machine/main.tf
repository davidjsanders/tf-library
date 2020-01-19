resource "azurerm_virtual_machine" "vm" {
  count = var.vm.vm-count

  resource_group_name              = var.vm.rg-name
  vm_size                          = var.vm.size
  availability_set_id              = var.vm.avset-id
  delete_os_disk_on_termination    = var.vm-os-disk.delete-on-terminate
  delete_data_disks_on_termination = var.vm-data-disk.delete-on-terminate
  location                         = var.vm.location

  name = upper(
    format(
      "VM-%s-%01d",
      upper(var.vm.name-prefix),
      count.index + 1
    ),
  )

  network_interface_ids = var.vm.network-interfaces

  boot_diagnostics {
    storage_uri = var.vm.boot-sa-uri
    enabled     = var.vm.boot-diags
  }

  storage_image_reference {
    id = var.vm.storage-image-reference
  }

  storage_os_disk {
    name              = var.vm-os-disk.disk-name
    caching           = var.vm-os-disk.caching
    create_option     = var.vm-os-disk.create-option
    managed_disk_type = var.vm-os-disk.disk-type
  }

  os_profile {
    computer_name = lower(
      format(
        "vm-%s-%01d",
        lower(var.vm.name-prefix),
        count.index + 1
      ),
    )
    admin_username = var.vm.admin-user
    admin_password = var.vm.admin-password
    custom_data    = var.vm.custom-data
  }

  os_profile_linux_config {
    disable_password_authentication = var.vm.disable-password-auth

    ssh_keys {
      path     = "/home/${var.vm.admin-user}/.ssh/authorized_keys"
      key_data = var.vm.public-key
    }
  }

  tags = var.tags
}
