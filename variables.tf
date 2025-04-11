#### Common variables
variable "resource_group_name" {
  description = "Name of the resource group."
  type        = string
}

variable "location" {
  description = "Azure region to use."
  type        = string

  validation {
    condition     = contains(["West US 2", "Central US", "East US 2", "West Europe", "East Asia"], var.location)
    error_message = "Location must be one of the following: 'West US 2', 'Central US', 'East US 2', 'West Europe', 'East Asia'."
  }
}

variable "location_short" {
  description = "Short string for Azure location."
  type        = string
}

variable "client_name" {
  description = "Client name/account used in naming."
  type        = string
}

variable "environment" {
  description = "Project environment."
  type        = string
}

variable "stack" {
  description = "Project stack name."
  type        = string
}
