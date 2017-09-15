variable "EnvironmentCIDR" {
    type = "map"
    default = {
        "DEV" = "10.10.0.0/16"
        "PROD" = "10.20.0.0/16"
    }
}