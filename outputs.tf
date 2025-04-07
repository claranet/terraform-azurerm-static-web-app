output "resource" {
  description = "Azure Static Web Apps resource object."
  value       = azurerm_static_web_app.main
}

output "id" {
  description = "Azure Static Web Apps ID."
  value       = azurerm_static_web_app.main.id
}

output "name" {
  description = "Azure Static Web Apps name."
  value       = azurerm_static_web_app.main.name
}

output "identity_principal_id" {
  description = "Azure Static Web Apps system identity principal ID."
  value       = try(azurerm_static_web_app.main.identity[0].principal_id, null)
}

output "module_diagnostics" {
  description = "Diagnostics settings module outputs."
  value       = module.diagnostics
}
