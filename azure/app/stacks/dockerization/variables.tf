# This is where you put your variables declaration

variable "rg_location" {
    type = string
    description = "Resource group location"
    default = "West Europe"
}

variable "container_sku" {
    type = string
    default = "Standard"
}

variable "container_admin" {
    type = bool
    default = "false"
}

variable "container_locations" {
    type = list(string)
    default = ["East US", "West Europe"]
}