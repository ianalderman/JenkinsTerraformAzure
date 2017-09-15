variable "subscription_id" {}
variable "client_id" {}
variable "client_secret" {}
variable "tenant_id" {}

variable "environment_id" {}
variable "region_id" {}
variable "azure_region" {}


variable "targetRegion" {
    type = "map"
    default = {
        "dev" = "eun"
    }
}

variable "environmentVnet" {
    type = "map"
    default = {
        "dev" = "10.0.0.0/16"
    }
}

variable "environmentVnetSubnet" {
    type = "map"
    default = {
        "devWeb" = "10.0.0.1/24"
        "devApp" = "10.0.0.2/24"
        "devDB" = "10.0.0.3/24"
    }
}

variable "appSubnet" {
    type = "map"
    default = {
        "website" = "web"
    }
}

variable "azureregion" {
    type = "map"
    default = {
        eun = "northeurope"
        euw = "westeurope"
        uks = "uksouth"
        ukn = "uknorth"
    }
}