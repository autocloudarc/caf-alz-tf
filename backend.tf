// backend state file
terraform {
  backend "azurerm" {
      resource_group_name = "tf-shared-rgp-01"
      storage_account_name = "1tfme84610eb"
      container_name = "dev-tfstate"
      key = "dev.tfstate"
  }
}