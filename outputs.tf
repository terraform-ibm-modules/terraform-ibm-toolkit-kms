output "id" {
  value       = local.module.id
  description = "The id of the provisioned instance."
}

output "guid" {
  value       = local.module.guid
  description = "The id of the provisioned instance."
}

output "name" {
  value       = local.module.name
  description = "The name of the provisioned instance."
}

output "crn" {
  description = "The id of the provisioned instance"
  value       = local.module.crn
}

output "location" {
  description = "The location of the provisioned instance"
  value       = local.module.location
}

output "service" {
  description = "The service name of the key provisioned for the instance"
  value       = local.module.service
}

output "label" {
  description = "The label for the instance"
  value       = local.module.label
}
