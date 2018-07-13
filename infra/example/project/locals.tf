
locals {

  env = {

###################################################################
# DEFAULTS
###################################################################

    defaults = {
      location = "westus"
      vnet_name = "vnet"
      address_space = "10.0.0.0/16"
    }

    defaults_lists= {
      subnet_names = ["subnet1", "subnet2"]
      subnet_prefixes = ["10.0.1.0/24", "10.0.2.0/24"]
    }

###################################################################
# DEV
###################################################################
    dev = {
      location = "westus"

      environment = "dev"
      resource_group_name = "dev-example-datacenter"
      use_msi = true
      subscription_id = ""
      tenant_id = ""

      remote_state_resource_group_name  = "${var.resource_group_name}"
      remote_state_storage_account_name = "${var.storage_account_name}"
      
    }

    dev_lists= {
    }

###################################################################
# STAGE
###################################################################

    stage = {
      environment = "stage"
      resource_group_name = "stage-example-datacenter"
      use_msi = true
      subscription_id = "something else"
      tenant_id = "something else"

      remote_state_resource_group_name  = "something else"
      remote_state_storage_account_name = "something else"
    }

    stage_lists= {
    }

###################################################################
# PROD
###################################################################

    production = {
      environment = "production"
      resource_group_name = "production-example-datacenter"
      use_msi = true
      subscription_id = "something else"
      tenant_id = "something else"

      remote_state_resource_group_name  = "something else"
      remote_state_storage_account_name = "something else"
    }

    production_lists= {
    }

  }

  workspace = "${merge(local.env["defaults"], local.env[terraform.workspace])}"
  workspace_lists= "${merge(local.env["defaults_lists"], local.env[format("%v_lists",terraform.workspace)])}"
}
