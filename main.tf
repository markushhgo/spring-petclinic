
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

resource "azurerm_container_group" "petcliniccontainer" {
  name                = "petclinic-continst"
  location            = "West Europe"
  resource_group_name = "markushResourceGroup"
  ip_address_type     = "public"
  dns_name_label      = "aci-labell"
  os_type             = "Linux"

  container {
    name   = "petclinic"
    image  = "markushtesti.azurecr.io/petclinic:latest"
    cpu    = "0.5"
    memory = "1.5"

    ports {
      port     = 80
      protocol = "TCP"
    }
  }

  tags = {
    environment = "testing"
  }
}