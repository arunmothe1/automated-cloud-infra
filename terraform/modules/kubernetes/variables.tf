variable "project_name" {
  description = "project_name"
  type        = string
}

variable "private_app_subnet_ids" {
  description = "private application subnet ids"
  type        = list(string)
}

variable "security_group_id" {
  description = "kubernetes security group id"
  type        = string
}

variable "instance_type" {
  description = "kubernetes ec2 instance type"
  type        = string
  default     = "t3.medium"
}