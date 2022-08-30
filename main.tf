# We strongly recommend using the required_providers block to set the
# Azure Provider source and version being used.

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
    azurerm.connectivity = azurerm
    azurerm.management   = azurerm
  }

  root_parent_id            = data.azurerm_client_config.core.tenant_id
  root_id                   = var.root_id
  root_name                 = var.root_name
  deploy_core_landing_zones = true

  # The following variables are used to configure the management resources.
  deploy_management_resources    = var.deploy_management_resources
  subscription_id_management     = data.azurerm_client_config.core.subscription_id
  configure_management_resources = local.configure_management_resources

  # 10.06.01.AssignIdentityPolicies
  deploy_identity_resources    = true
  subscription_id_identity     = var.identitySubscriptionId
  configure_identity_resources = local.configure_identity_resources

/*
  deploy_connectivity_resources    = var.deploy_connectivity_resources
  subscription_id_connectivity     = var.connectivitySubscriptionId
  configure_connectivity_resources = local.configure_connectivity_resources
*/
}
