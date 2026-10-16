variable "project_name" {
  description = "project name"
  type        = string
}

variable "aws_region" {
  description = "aws region"
  type        = string
}

variable "vpc_cidr" {
  description = "vpc cidr"
  type        = string
}

variable "availability_zones" {
  description = "availability zones"
  type        = list(string)

  validation {
    condition     = length(var.availability_zones) == 2
    error_message = "exactly 2 availability_zones are required. "
  }
}

variable "public_subnet_cidrs" {
  description = "public subnet cidrs"
  type        = list(string)

  validation {
    condition     = length(var.public_subnet_cidrs) == 2
    error_message = "exactly 2 public subnet cidrs are required. "
  }
}

variable "private_app_subnet_cidrs" {
  description = "private app subnet cidrs"
  type        = list(string)

  validation {
    condition     = length(var.private_app_subnet_cidrs) == 2
    error_message = "exactly 2 private app subnet cidrs are required. "
  }
}

variable "private_db_subnet_cidrs" {
  description = "private database subnet cidrs"
  type        = list(string)

  validation {
    condition     = length(var.private_db_subnet_cidrs) == 2
    error_message = "exactly 2 private db subnet cidrs are required. "
  }
}

variable "admin_ip" {
  description = "adimn public ip for jenkins ssh"
  type        = string
}

variable "key_name" {
  description = "Exsting aws ec2 key pair name"
  type        = string
}