
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

variable "registry_server" {
  default = ""
}

variable "registry_username" {
  default = ""
}

variable "registry_password" {
  default = ""
}

variable "image_id" {
  default = ""
}

resource "azurerm_container_group" "petcliniccontainer" {
  name                = "petclinic-continst"
  location            = "West Europe"
  resource_group_name = "markushpilvistorage"
  ip_address_type     = "public"
  dns_name_label      = "aci-labell"
  os_type             = "Linux"

  image_registry_credential {
    server   = var.registry_server
    username = var.registry_username
    password = var.registry_password
  }

  container {
    name   = "petclinic"
    image  = var.image_id
    cpu    = "0.5"
    memory = "1.5"

    ports {
      port     = 443
      protocol = "TCP"
    }
  }

  tags = {
    environment = "testing"
  }
}