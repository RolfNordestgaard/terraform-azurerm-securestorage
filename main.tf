terraform {
  required_version = ">=1.3.7"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.43.0"
    }
  }
}

locals {
  tags = {
    "Environment" = var.environment
  }
}

resource "azurerm_storage_account" "securestorage" {
  name                     = var.storage_account_name
  location                 = var.location
  resource_group_name      = var.resource_groupe_name
  account_tier             = "Standard"
  account_replication_type = var.environment == "Production" ? "GRS" : "LRS"

  tags = local.tags
}