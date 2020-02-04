resource "azurerm_virtual_machine_scale_set" "linux-vm-scale-set" {
  name                = upper(
    format(
      "VMSS-%s%s",
      upper(var.scale-set.scale-set-name),
      var.scale-set.randomizer
    )
  )
  location            = var.scale-set.location
  resource_group_name = var.scale-set.rg-name
  upgrade_policy_mode = var.scale-set.server.upgrade-policy-mode

  sku {
    name     = var.scale-set.server.machine-size
    tier     = var.scale-set.server.tier
    capacity = var.scale-set.server.capacity
  }

  network_profile {
    name    = upper(
      format(
          "PROFILE-%s%s",
          upper(var.scale-set.scale-set-name),
          var.scale-set.randomizer
      )
    )
    primary = true

    ip_configuration {
      primary                                = true
      name                                   = "IPv4"
      subnet_id                              = var.scale-set.network.subnet-id
      load_balancer_backend_address_pool_ids = var.scale-set.network.lb-backend-address-pool-ids
      load_balancer_inbound_nat_rules_ids    = var.scale-set.network.lb-inbound-nat-rules-ids
    }
  }

  boot_diagnostics {
    storage_uri = var.scale-set.boot-diagnostics.uri
    enabled     = var.scale-set.boot-diagnostics.enable
  }

  storage_profile_image_reference {
    id = var.scale-set.os.storage-image-reference
  }

  storage_profile_os_disk {
    caching           = var.scale-set.os-disk.caching
    create_option     = var.scale-set.os-disk.create-option
    managed_disk_type = var.scale-set.os-disk.managed-type
  }

  dynamic "storage_profile_data_disk" {
    for_each = var.scale-set.data-disk
    # for_each = [
    #   for disk in var.scale-set.data-disk: {

    #   }
    # ]
    iterator = data-disk

    content {
      create_option     = data-disk.value.create_option
      caching           = data-disk.value.caching
      disk_size_gb      = data-disk.value.disk_size_gb
      lun               = data-disk.value.lun
      managed_disk_type = data-disk.value.managed_disk_type
    }
  }

  os_profile {
    computer_name_prefix = lower(format(
        "%s%s",
        var.scale-set.os.hostname,
        var.scale-set.randomizer
      ))
    admin_username = var.scale-set.os.admin-user
    admin_password = random_password.password.result
    custom_data    = var.scale-set.os.custom-data
  }

  os_profile_linux_config {
    disable_password_authentication = var.scale-set.os.disable-password-auth
  }

  tags = var.tags
}