output "Public IP Address" {
  description = "VM Public IP"
  value       = "${module.vms.public_ip_address}"
}

