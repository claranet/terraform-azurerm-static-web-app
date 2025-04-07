data "azurecaf_name" "static_web_app" {
  name          = var.stack
  resource_type = "azurerm_resource_group" # "azurerm_static_web_app"
  prefixes      = compact([local.name_prefix, "stapp"])
  suffixes      = compact([var.client_name, var.location_short, var.environment, local.name_suffix])
  use_slug      = true
  clean_input   = true
  separator     = "-"
}
