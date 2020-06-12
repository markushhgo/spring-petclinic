
terraform {
    backend "azurerm" {
        resource_group_name  = "markushpilvistorage"
        storage_account_name = "storagepilvi"
        container_name       = "tfstorage"
        key                  = "tfstate"
    }
}

provider "azurerm" {
  version = "~> 2.0"
  features {}
} 

# Create a resource group
resource "azurerm_resource_group" "markushResourceGroup" {
  name     = "markushResourceGroup"
  location = "West Europe"
}