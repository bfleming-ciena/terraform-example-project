# Unfortunately we can't use interpolated variables for the init/backend.
#
# These must be filled in by hand
terraform {
  backend "azurerm" {
  key = "terraform.tfstate"
  }
}

