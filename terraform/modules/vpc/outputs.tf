output "vpc_id" {
  description = "vpc id"
  value       = aws_vpc.vpc.id
}

output "vpc_cidr" {
  description = "vpc cidr"
  value       = aws_vpc.vpc.cidr_block
}

output "public_subnet_ids" {
  description = "public subnet ids"
  value       = aws_subnet.public[*].id
}

output "private_app_subnet_ids" {
  description = "private app subnet ids"
  value       = aws_subnet.app[*].id
}

output "private_db_subnet_ids" {
  description = "private db subnet ids"
  value       = aws_subnet.db[*].id
}

output "internet_gateway_id" {
  description = "internet gateway id"
  value       = aws_internet_gateway.igw.id
}

output "nat_gateway_ids" {
  description = "NAT Gateway IDs"
  value       = aws_nat_gateway.nat[*].id
}

output "availability_zones" {
  description = "availability zones"
  value       = var.availability_zones
}