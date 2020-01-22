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
      "VM-%s-%02d",
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
    name              = upper(
      format(
        "DSK-%s-OSD-%02d",
        var.vm-os-disk.disk-name,
        count.index + 1
      )
    )
    caching           = var.vm-os-disk.caching
    create_option     = var.vm-os-disk.create-option
    managed_disk_type = var.vm-os-disk.disk-type
  }

  dynamic "storage_data_disk" {
    for_each = [for i in range(0, var.vm-data-disk.disk-count):{
        name  = upper(
          format(
            "DSK-%s-%02d-DATA-%02d",
            var.vm-data-disk.disk-prefix,
            count.index + 1,
            i + 1
          )
        )
        caching           = var.vm-data-disk.caching
        create_option     = var.vm-data-disk.create-option
        managed_disk_type = var.vm-data-disk.disk-type
        lun               = i
        disk_size_gb      = var.vm-data-disk.disk-size-gb
      }]

    content {
      name              = storage_data_disk.value.name
      caching           = storage_data_disk.value.caching
      create_option     = storage_data_disk.value.create_option
      managed_disk_type = storage_data_disk.value.managed_disk_type
      lun               = storage_data_disk.value.lun
      disk_size_gb      = storage_data_disk.value.disk_size_gb
    }
  }

  os_profile {
    computer_name = lower(
      format(
        "%s-%01d",
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
