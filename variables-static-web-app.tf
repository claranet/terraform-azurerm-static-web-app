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
  default     = null
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
  description = "Should changes to the configuration file be permitted."
  type        = bool
  default     = true
}

variable "preview_environments_enabled" {
  description = "Should preview environments be enabled."
  type        = bool
  default     = true
}

variable "custom_domains" {
  description = "Custom domains block information."
  type = list(object({
    domain_name     = string
    validation_type = optional(string, "cname-delegation")
  }))
  default  = []
  nullable = false

  validation {
    condition     = alltrue([for domain in var.custom_domains : contains(["cname-delegation", "dns-txt-token"], domain.validation_type)])
    error_message = "In `var.custom_domains`, validation type must be either 'cname-delegation' or 'dns-txt-token'."
  }
}
