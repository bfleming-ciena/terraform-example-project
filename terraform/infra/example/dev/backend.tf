# Unfortunately we can't use interpolated variables for the init/backend.
#
# These must be filled in by hand
terraform {
  backend "azurerm" {
    resource_group_name  = "VALUE NEEDED"
    storage_account_name = "VALUE NEEDED"
    key                  = "VALUE NEEDED"
    container_name       = "VALUE NEEDED"
  }
}

