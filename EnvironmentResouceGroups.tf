# Configure the Microsoft Azure Provider
provider "azurerm" {
  subscription_id = "${var.subscription_id}"
  client_id       = "${var.client_id}"
  client_secret   = "${var.client_secret}"
  tenant_id       = "${var.tenant_id}"
}

# Create network resource group
resource "azurerm_resource_group" "rgNetwork" {
  name     = "rg${var.environment_id}${var.region_id}Network"
  location = "azure_region"
}

# Create Web Servers resource group
resource "azurerm_resource_group" "rgWebServers" {
  name     = "rg${var.environment_id}${var.region_id}WebServers"
  location = "azure_region"
}

# Create App Servers resource group
resource "azurerm_resource_group" "rgAppServers" {
  name     = "rg${var.environment_id}${var.region_id}AppServers"
  location = "azure_region"
}

# Create DB Servers resource group
resource "azurerm_resource_group" "rgDBServers" {
  name     = "rg${var.environment_id}${var.region_id}DBServers"
  location = "azure_region"
}