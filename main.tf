# We strongly recommend using the required_providers block to set the
# Azure Provider source and version being used.

/*
If using pipelines, use the following format for GitHub secrets to allow GitHub Actions to access the secrets:
https://docs.microsoft.com/en-us/azure/developer/github/connect-from-azure?tabs=azure-portal%2Cwindows
{
"clientId": "<GUID>",
"clientSecret": "<GUID>",
"subscriptionId": "<GUID>",
"tenantId": "<GUID>"
}

To access the backend state file hosted in an Azure storage account see the following documentation:
https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/guides/service_principal_client_secret
*/


# You can use the azurerm_client_config data resource to dynamically
# extract connection settings from the provider configuration.

data "azurerm_client_config" "core" {}

# Call the caf-enterprise-scale module directly from the Terraform Registry
# pinning to the latest version

module "enterprise_scale" {
  source  = "Azure/caf-enterprise-scale/azurerm"
  version = "2.3.1"

  providers = {
    azurerm              = azurerm
    azurerm.connectivity = azurerm.connectivity
    azurerm.management   = azurerm.management
  }

  root_parent_id            = data.azurerm_client_config.core.tenant_id
  root_id                   = var.root_id
  root_name                 = var.root_name
  deploy_core_landing_zones = true
  library_path              = "${path.root}/lib"


/*
  custom_landing_zones = {
    "${var.root_id}-online-example-1" = {
      display_name               = "${upper(var.root_id)} Online Example 1"
      parent_management_group_id = "${var.root_id}-landing-zones"
      subscription_ids           = []
      archetype_config = {
        archetype_id   = "customer_online"
        parameters     = {}
        access_control = {}
      }
    }
    "${var.root_id}-online-example-2" = {
      display_name               = "${upper(var.root_id)} Online Example 2"
      parent_management_group_id = "${var.root_id}-landing-zones"
      subscription_ids           = []
      archetype_config = {
        archetype_id   = "customer_online"
        parameters     = {
          Deny-Resource-Locations = {
            listOfAllowedLocations = ["eastus",]
          }
          Deny-RSG-Locations = {
            listOfAllowedLocations = ["eastus",]
          }
        }
        access_control = {}
      }
    }
  }
*/

  # The following variables are used to configure the management resources.
  deploy_management_resources    = var.deploy_management_resources
  subscription_id_management     = data.azurerm_client_config.core.subscription_id
  configure_management_resources = local.configure_management_resources

  # 10.06.01.AssignIdentityPolicies
  deploy_identity_resources    = true
  subscription_id_identity     = var.identitySubscriptionId
  configure_identity_resources = local.configure_identity_resources

  deploy_connectivity_resources    = var.deploy_connectivity_resources
  subscription_id_connectivity     = var.connectivitySubscriptionId
  configure_connectivity_resources = local.configure_connectivity_resources

  deploy_demo_landing_zones = true
}
