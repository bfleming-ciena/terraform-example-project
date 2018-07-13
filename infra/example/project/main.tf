# Assumes MSI auth, which is baked into the instance.
provider "azurerm" {
use_msi = true
subscription_id = "${local.workspace["subscription_id"]}"
tenant_id = "${local.workspace["tenant_id"]}"
}

# Depends on the network component. We need this to query information on the network.
data "terraform_remote_state" "network" {
      backend = "azurerm"
      workspace = "${terraform.workspace}"
      
      config {
      resource_group_name  = "${local.workspace["remote_state_resource_group_name"]}"
      storage_account_name = "${local.workspace["remote_state_storage_account_name"]}"
      key                  = "vnet/terraform.tfstate"
      access_key           = "${var.access_key}"
      container_name       = "terraform-states"
      
} }

# Some initial VM to create
module "vms" {
    resource_group="${data.terraform_remote_state.network.resource_group_name}"
    environment = "${local.workspace["environment"]}"
    source = "../modules/vms"
    vnet_name = "${data.terraform_remote_state.network.vnet_name }"
    subnet_id = "${data.terraform_remote_state.network.vnet_subnets[0]}"
}