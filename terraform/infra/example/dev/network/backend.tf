terraform {
  backend "azurerm" {
    resource_group_name  = "VALUE NEEDED"
    storage_account_name = "VALUE NEEDED"
    container_name       = "VALUE NEEDED"
    key                  = "VALUE NEEDED"
  }
}
