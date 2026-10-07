output "vpc_id" {
  description = "vpc id"
  value       = module.vpc.vpc_id
}

output "public_subnet_ids" {
  description = "public subnet ids"
  value       = module.vpc.public_subnet_ids
}

output "private_app_subnet_ids" {
  description = "private app subnet ids"
  value       = module.vpc.private_app_subnet_ids
}

output "private_db_subnet_ids" {
  description = "private db subnet ids"
  value       = module.vpc.private_db_subnet_ids
}

output "internet_gateway_id" {
  description = "internet gateway id"
  value       = module.vpc.internet_gateway_id
}

output "nat_gateway_id" {
  description = "nat gateway id"
  value       = module.vpc.internet_gateway_id
}

output "availability_zones" {
  description = "availability zones"
  value       = module.vpc.availability_zones
}