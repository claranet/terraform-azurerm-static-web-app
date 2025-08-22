# Azure Static Web Apps
[![Changelog](https://img.shields.io/badge/changelog-release-green.svg)](CHANGELOG.md) [![Notice](https://img.shields.io/badge/notice-copyright-blue.svg)](NOTICE) [![Apache V2 License](https://img.shields.io/badge/license-Apache%20V2-orange.svg)](LICENSE) [![OpenTofu Registry](https://img.shields.io/badge/opentofu-registry-yellow.svg)](https://search.opentofu.org/module/claranet/static-web-app/azurerm/latest)

Azure module to deploy a [Azure Static Web Apps](https://docs.microsoft.com/en-us/azure/xxxxxxx).

<!-- BEGIN_TF_DOCS -->
## Global versioning rule for Claranet Azure modules

| Module version | Terraform version | OpenTofu version | AzureRM version |
| -------------- | ----------------- | ---------------- | --------------- |
| >= 8.x.x       | **Unverified**    | 1.8.x            | >= 4.0          |
| >= 7.x.x       | 1.3.x             |                  | >= 3.0          |
| >= 6.x.x       | 1.x               |                  | >= 3.0          |
| >= 5.x.x       | 0.15.x            |                  | >= 2.0          |
| >= 4.x.x       | 0.13.x / 0.14.x   |                  | >= 2.0          |
| >= 3.x.x       | 0.12.x            |                  | >= 2.0          |
| >= 2.x.x       | 0.12.x            |                  | < 2.0           |
| <  2.x.x       | 0.11.x            |                  | < 2.0           |

## Contributing

If you want to contribute to this repository, feel free to use our [pre-commit](https://pre-commit.com/) git hook configuration
which will help you automatically update and format some files for you by enforcing our Terraform code module best-practices.

More details are available in the [CONTRIBUTING.md](./CONTRIBUTING.md#pull-request-process) file.

## Usage

This module is optimized to work with the [Claranet terraform-wrapper](https://github.com/claranet/terraform-wrapper) tool
which set some terraform variables in the environment needed by this module.
More details about variables set by the `terraform-wrapper` available in the [documentation](https://github.com/claranet/terraform-wrapper#environment).

⚠️ Since modules version v8.0.0, we do not maintain/check anymore the compatibility with
[Hashicorp Terraform](https://github.com/hashicorp/terraform/). Instead, we recommend to use [OpenTofu](https://github.com/opentofu/opentofu/).

```hcl
module "static_web_app" {
  source  = "claranet/static-web-app/azurerm"
  version = "x.x.x"

  location            = module.azure_region.location
  location_short      = module.azure_region.location_short
  resource_group_name = module.rg.name

  client_name = var.client_name
  environment = var.environment
  stack       = var.stack

  logs_destinations_ids = [
    module.run.logs_storage_account_id,
    module.run.log_analytics_workspace_id
  ]

  extra_tags = {
    foo = "bar"
  }
}
```

## Providers

| Name | Version |
|------|---------|
| azurecaf | ~> 1.2.28 |
| azurerm | ~> 4.31 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| diagnostics | claranet/diagnostic-settings/azurerm | ~> 8.0 |

## Resources

| Name | Type |
|------|------|
| [azurerm_static_web_app.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/static_web_app) | resource |
| [azurerm_static_web_app_custom_domain.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/static_web_app_custom_domain) | resource |
| [azurecaf_name.static_web_app](https://registry.terraform.io/providers/claranet/azurecaf/latest/docs/data-sources/name) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| app\_settings | App settings for the Static Web App. | `map(string)` | `null` | no |
| basic\_auth | Basic authentication block information. | <pre>object({<br/>    password     = optional(string)<br/>    environments = optional(string)<br/>  })</pre> | `null` | no |
| client\_name | Client name/account used in naming. | `string` | n/a | yes |
| configuration\_file\_changes\_enabled | Should changes to the configuration file be permitted. | `bool` | `true` | no |
| custom\_domains | Custom domains block information. | <pre>list(object({<br/>    domain_name     = string<br/>    validation_type = optional(string, "cname-delegation")<br/>  }))</pre> | `[]` | no |
| custom\_name | Custom Azure Static Web Apps, generated if not set. | `string` | `""` | no |
| default\_tags\_enabled | Option to enable or disable default tags. | `bool` | `true` | no |
| diagnostic\_settings\_custom\_name | Custom name of the diagnostics settings, name will be `default` if not set. | `string` | `"default"` | no |
| environment | Project environment. | `string` | n/a | yes |
| extra\_tags | Additional tags to add on resources. | `map(string)` | `{}` | no |
| identity | Identity block information. | <pre>object({<br/>    type         = optional(string, "SystemAssigned")<br/>    identity_ids = optional(list(string))<br/>  })</pre> | `{}` | no |
| location | Azure region to use. | `string` | n/a | yes |
| location\_short | Short string for Azure location. | `string` | n/a | yes |
| logs\_categories | Log categories to send to destinations. | `list(string)` | `null` | no |
| logs\_destinations\_ids | List of destination resources IDs for logs diagnostic destination.<br/>Can be `Storage Account`, `Log Analytics Workspace` and `Event Hub`. No more than one of each can be set.<br/>If you want to use Azure EventHub as a destination, you must provide a formatted string containing both the EventHub Namespace authorization send ID and the EventHub name (name of the queue to use in the Namespace) separated by the <code>&#124;</code> character. | `list(string)` | n/a | yes |
| logs\_metrics\_categories | Metrics categories to send to destinations. | `list(string)` | `null` | no |
| name\_prefix | Optional prefix for the generated name. | `string` | `""` | no |
| name\_suffix | Optional suffix for the generated name. | `string` | `""` | no |
| preview\_environments\_enabled | Should preview environments be enabled. | `bool` | `true` | no |
| public\_network\_access\_enabled | Whether the Azure Static Web Apps is available from public network. | `bool` | `false` | no |
| repository | Repository block information. | <pre>object({<br/>    branch = string<br/>    token  = string<br/>    url    = string<br/>  })</pre> | `null` | no |
| resource\_group\_name | Name of the resource group. | `string` | n/a | yes |
| sku | The SKU of the Static Web App. | `string` | `"Standard"` | no |
| stack | Project stack name. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| api\_key | Azure Static Web Apps API key. |
| default\_hostname | Azure Static Web Apps default hostname. |
| id | Azure Static Web Apps ID. |
| identity\_principal\_id | Azure Static Web Apps system identity principal ID. |
| module\_diagnostics | Diagnostics settings module outputs. |
| name | Azure Static Web Apps name. |
| resource | Azure Static Web Apps resource object. |
| resource\_custom\_domains | Azure Static Web Apps custom domains. |
<!-- END_TF_DOCS -->

## Related documentation

Microsoft Azure documentation: xxxx
