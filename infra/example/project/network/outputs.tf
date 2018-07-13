output "vnet_subnets" {
  description = "The ids of subnets created inside the newl vNet"
  # value       = "${azurerm_subnet.subnet.*.id}"
  value = ["${module.vnet.vnet_subnets}"]
}

output "vnet_name" {
  description = "Name of the vnet"
  # value       = "${azurerm_subnet.subnet.*.id}"
  value = ["${module.vnet.vnet_name}"]
}

output "resource_group_name" {
  description = "Resource Group Name"
  # value       = "${azurerm_subnet.subnet.*.id}"
  value = "${azurerm_resource_group.resourcegroup.name}"
}

output "location" {
  description = "Location of Resource Group"
  # value       = "${azurerm_subnet.subnet.*.id}"
  value =  "${local.workspace["location"]}"
}