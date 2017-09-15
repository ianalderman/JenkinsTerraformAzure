variable "app" {}

variable "subnets" {map("web",modEnvironment.snWebId,"app", modEnvironment.snAppId,"db",modEnvironment.snDbId)}

resource "azurerm_resource_group" "modScaleSetRG" {
  name     = "rg-${var.targetRegion[${var.target}]}-${var.target}-${var.app}"
  location = ""${lookup(var.azureregion, var.target)}"
}

resource "azurerm_virtual_machine_scale_set" "modScaleSetSS" {
  name                = "ss-${var.region}-${var.target}-${var.app}"
  location            = ""${lookup(var.azureregion, var.target)}"
  resource_group_name = "${azurerm_resource_group.modScaleSetRG.name}"
  upgrade_policy_mode = "Manual"

  sku {
    name     = "Standard_A0"
    tier     = "Standard"
    capacity = 2
  }

  os_profile {
    computer_name_prefix = "testvm"
    admin_username       = "myadmin"
    admin_password       = "Passwword1234"
  }

  os_profile_linux_config {
    disable_password_authentication = true

    ssh_keys {
      path     = "/home/myadmin/.ssh/authorized_keys"
      key_data = "${file("~/.ssh/demo_key.pub")}"
    }
  }

  resource "azurerm_resource_group" "test" {
  name     = "acctestrg"
  location = "West US"
}
  
resource "azurerm_virtual_machine_scale_set" "test" {
  name                = "mytestscaleset-1"
  location            = "West US"
  resource_group_name = "${azurerm_resource_group.test.name}"
  upgrade_policy_mode = "Manual"

  sku {
    name     = "Standard_A0"
    tier     = "Standard"
    capacity = 2
  }

  os_profile {
    computer_name_prefix = "testvm"
    admin_username       = "myadmin"
    admin_password       = "Passwword1234"
  }

  os_profile_linux_config {
    disable_password_authentication = true

    ssh_keys {
      path     = "/home/myadmin/.ssh/authorized_keys"
      key_data = "${file("~/.ssh/demo_key.pub")}"
    }
  }

  network_profile {
    name    = "TestNetworkProfile"
    primary = true

    ip_configuration {
      name      = "TestIPConfiguration"
      lookup(var.)
      subnet_id = "${lookup(var.subnets, var.appSubnet[var.app]}"
    }
  }

  storage_profile_os_disk {
    name           = "osDiskProfile"
    caching        = "ReadWrite"
    create_option  = "FromImage"
    vhd_containers = ["${azurerm_storage_account.test.primary_blob_endpoint}${azurerm_storage_container.test.name}"]
  }

  storage_profile_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "14.04.2-LTS"
    version   = "latest"
  }

  settings = <<SETTINGS
    {
        "commandToExecute": "hostname"
    }
SETTINGS
}

 resource "azurerm_virtual_machine_extension" "CSE" {
  name                 = "hostname"
  location             = "West US"
  resource_group_name  = "${azurerm_resource_group.test.name}"
  virtual_machine_name = "${azurerm_virtual_machine.test.name}"
  publisher            = "Microsoft.OSTCExtensions"
  type                 = "CustomScriptForLinux"
  type_handler_version = "1.2"