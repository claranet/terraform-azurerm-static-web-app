resource "azurerm_static_web_app_custom_domain" "main" {
  for_each = { for domain in var.custom_domains : domain.domain_name => domain }

  static_web_app_id = azurerm_static_web_app.main.id
  domain_name       = each.key
  validation_type   = each.value.validation_type
}
