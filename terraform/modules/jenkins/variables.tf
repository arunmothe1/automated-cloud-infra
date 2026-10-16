
variable "project_name" {
  description = "Project name"
  type        = string
}

variable "subnet_id" {
  description = "Public subnet ID for Jenkins"
  type        = string
}

variable "security_group_id" {
  description = "Jenkins security group ID"
  type        = string
}

variable "instance_type" {
  description = "Jenkins EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "key_name" {
  description = "EC2 key pair name"
  type        = string
}
