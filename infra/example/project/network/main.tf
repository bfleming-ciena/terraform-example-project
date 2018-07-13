# Assumes MSI auth, which is baked into the instance.
provider "azurerm" {
use_msi = true
subscription_id = "${local.workspace["subscription_id"]}"
tenant_id = "${local.workspace["tenant_id"]}"
}

# Resource Group
#
resource "azurerm_resource_group" "resourcegroup" {
  name     = "${local.workspace["resource_group_name"]}"
  location = "${local.workspace["location"]}"

  tags {
    terraformn="true"
  }
}

# Virtual Network
#
module "vnet" {
    source = "../../modules/vnet"
    vnet_name = "${local.workspace["vnet_name"]}"
    resource_group_name = "${azurerm_resource_group.resourcegroup.name}"
    address_space = "${local.workspace["address_space"]}"
    subnet_names ="${local.workspace_lists["subnet_names"]}"
    subnet_prefixes = "${local.workspace_lists["subnet_prefixes"]}"
}

# Disabled because it didn't work with MSI.
# ## Lock the Resource Group - Save from accidental delete via terraform.
# resource "azurerm_management_lock" "resource-group-level" {
#   name       = "resource-group-level"
#   scope      = "${azurerm_resource_group.resourcegroup.id}"
#   lock_level = "CanNotDelete"
#   notes      = "Safety net. Don't allow automated delete."
# }