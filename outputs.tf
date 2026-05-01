output "id" {
  description = "The private DNS zone ID."
  value       = azurerm_private_dns_zone.this.id
}

output "name" {
  description = "The private DNS zone name."
  value       = azurerm_private_dns_zone.this.name
}

output "resource_group_name" {
  description = "The resource group containing the private DNS zone."
  value       = azurerm_private_dns_zone.this.resource_group_name
}

output "soa_record" {
  description = "The SOA record details for the private DNS zone."
  value       = azurerm_private_dns_zone.this.soa_record
}

output "number_of_record_sets" {
  description = "The number of record sets currently in the private DNS zone."
  value       = azurerm_private_dns_zone.this.number_of_record_sets
}
