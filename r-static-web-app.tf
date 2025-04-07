resource "azurerm_static_web_app" "main" {
  name = local.name

  location            = var.location
  resource_group_name = var.resource_group_name

  sku_tier = var.sku
  sku_size = var.sku

  configuration_file_changes_enabled = var.configuration_file_changes_enabled
  preview_environments_enabled       = var.preview_environments_enabled
  app_settings                       = var.app_settings

  public_network_access_enabled = var.public_network_access_enabled

  repository_branch = one(var.repository[*].branch)
  repository_token  = one(var.repository[*].token)
  repository_url    = one(var.repository[*].url)

  dynamic "basic_auth" {
    for_each = var.basic_auth[*]
    content {
      password     = var.basic_auth.password
      environments = var.basic_auth.environments
    }
  }

  dynamic "identity" {
    for_each = var.identity[*]
    content {
      type         = var.identity.type
      identity_ids = endswith(var.identity.type, "UserAssigned") ? var.identity.identity_ids : null
    }
  }

  tags = merge(local.default_tags, var.extra_tags)
}
