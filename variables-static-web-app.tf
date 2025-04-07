variable "identity" {
  description = "Identity block information."
  type = object({
    type         = optional(string, "SystemAssigned")
    identity_ids = optional(list(string))
  })
  default  = {}
  nullable = false
}

variable "sku" {
  description = "The SKU of the Static Web App."
  type        = string
  default     = "Standard"
}

variable "app_settings" {
  description = "App settings for the Static Web App."
  type        = map(string)
  default     = {}
  nullable    = false
}

variable "repository" {
  description = "Repository block information."
  type = object({
    branch = string
    token  = string
    url    = string
  })
  default  = null
  nullable = true
}

variable "basic_auth" {
  description = "Basic authentication block information."
  type = object({
    password     = optional(string)
    environments = optional(string)
  })
  default = null
}

variable "configuration_file_changes_enabled" {
  description = "Should changes to the configuration file be permitted. "
  type        = bool
  default     = true
}

variable "preview_environments_enabled" {
  description = "Should preview environments be enabled."
  type        = bool
  default     = true
}
