variable "resource_group_name" {
  type          = string
  description   = "Name of resource group"
  default       = "rg-paysystems-dev-001"
}

variable "location" {
    type        = string
    description = "Name of region"
    default     = "Australia East"
}

variable "tags" {
  description   = "Tags to apply to the resources"
  type          = map(string)
  default       = {
    project     = "modernisation"
    environment = "dev"
  }
}
