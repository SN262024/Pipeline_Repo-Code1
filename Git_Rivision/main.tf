terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.40.0"
    }
  }
  backend "azurerm" {
   resource_resource_group_name ="rg-Sasaram" 
    storage_account_name = "stgagbb"                                 
    container_name       = "containeragbb"                                  
    key                  = "agbb.tfstate"                   
  }
}

provider "azurerm" {
  features {}
  subscription_id ="177b7e12-5f03-4f63-bcd1-ed6d1d776bff"
}

resource "azurerm_resource_group" "rg_DOS" {
  name     = "rg-DOS"
  location = "West Europe"
}
resource "azurerm_storage_account" "stg55" {
  name                     = "stgdos"
  resource_group_name      = azurerm_resource_group.rg_DOS.name
  location                 = azurerm_resource_group.rg_DOS.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
}