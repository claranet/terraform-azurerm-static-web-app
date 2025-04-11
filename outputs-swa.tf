output "api_key" {
  value       = azurerm_static_web_app.main.api_key
  description = "Azure Static Web Apps API key."
  sensitive   = true
}

output "default_hostname" {
  value       = azurerm_static_web_app.main.default_host_name
  description = "Azure Static Web Apps default hostname."
}
