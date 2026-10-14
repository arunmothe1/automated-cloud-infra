variable "project_name" {
    descripetion = "project_name"
    type = string
}

variable "subnet_id" {
    descripetion = "public subnet id for Jenkins"
    type = string
}

variable "security_group_id" {
    descripetion = "Jenkins security group id"
    type = string 
}

variable = "instance_type" {
    descripetion = "Jenkins ec2 instance type"
    type = string 
    default = "t3.micro"
}

variable = "key_name" {
    descripetion = "ec2 instance key pair name"
    type = string
}