variable "subscription_id" {}
variable "client_id" {}
variable "client_secret" {}
variable "tenant_id" {}

variable "environment_id" {}
variable "region_id" {}
variable "azure_region" {}

variable "region" {}
variable "target" {} 


resource "azurerm_resource_group" "modEnvRG" {
  name     = "rg-${var.targetRegion[${var.target}]}-${var.target}-network"
  location = "${lookup(var.azureregion, var.targetRegion[var.target])}"
}

lookup(var.azureregion, var.target)
resource "azurerm_virtual_network" "modEnvVnet" {
  name                = "vn-${var.region}-${var.target}"
  address_space       = ["${var.environmentVnet[${var.target}]}"]
  location            = "${lookup(var.azureregion, var.targetRegion[var.target])}"
  resource_group_name = "${azurerm_resource_group.modEnvRGrg.name}"
}

resource "azurerm_subnet" "modEnvWebSubnet" {
  name                 = "sn-${var.region}-${var.target}-web"
  resource_group_name  = "${azurerm_resource_group.modEnvRGrg.name}"
  virtual_network_name = "${azurerm_virtual_network.modEnvVnet.name}"
  address_prefix       = "${var.environmentVnetSubnet[${var.target}Web]}"
}

resource "azurerm_subnet" "modEnvAppSubnet" {
  name                 = "sn-${var.region}-${var.target}-app"
  resource_group_name  = "${azurerm_resource_group.modEnvRGrg.name}"
  virtual_network_name = "${azurerm_virtual_network.modEnvVnet.name}"
  address_prefix       = "${var.environmentVnetSubnet[${var.target}App]}"
}

resource "azurerm_subnet" "modEnvDBSubnet" {
  name                 = "sn-${var.region}-${var.target}-db"
  resource_group_name  = "${azurerm_resource_group.modEnvRGrg.name}"
  virtual_network_name = "${azurerm_virtual_network.modEnvVnet.name}"
  address_prefix       = "${var.environmentVnetSubnet[${var.target}db]}"
}

output "vnName" {
  value = "${var.modEnvVnet.name}"
}

output "snWebId" {
  value = "${var.modEnvWebSubnet.Id}
}

output "snAppId" {
  value = "${var.modEnvAppSubnet.Id}
}

output "snDbId" {
  value = "${var.modEnvDBSubnet.Id}
}