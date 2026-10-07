# ALB Securuty Group

resource "aws_security_group" "alb" {
  name        = "${var.project_name}-alb-sg"
  description = "application security Group"
  vpc_id      = var.vpc_id

  ingress {
    description = "http"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "https"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "allowe outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    name = "${var.project_name}-alb-sg"
  }
}

# Jenkins security group

resource "aws_security_group" "Jenkins" {
  name        = "${var.project_name}-Jenkins-sg"
  description = "security group for Jenkins"
  vpc_id      = var.vpc_id

  ingress {
    description = "ssh from adimn ip"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_block  = [var.admin_ip]
  }

  ingress {
    description = "Jenkins web interface"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = [var.admin_ip]
  }

  egress {
    description = "allowe outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_block  = ["0.0.0.0/0"]
  }

  tags = {
    name = "${var.project_name}-Jenkins-sg"
  }
}

# Kubernetes security group 
resource "aws_security_group" "k8s" {
  name        = "${var.project_name}-k8s-sg"
  description = "security group for kubernetes nodes"
  vpc_id      = var.vpc_id

  ingress {
    description = "kubernetes api"
    from_port   = 6443
    to_port     = 6443
    protocol    = "tcp"
    cidr_blocks = [var.vpc_id]
  }

  ingress {
    description = "node communication"
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    self        = true
  }

  ingress {
    description = "ALB to kubernetes"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    security_groups = [
      aws_security_group.alb.id
    ]
  }

  egress {
    description = "allow outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    name = "${var.project_name}-k8s-sg"
  }
}

# RDS security group 

resource "aws_security_group" "RDS" {
  name        = "${var.project_name}-rds-sg"
  description = "security group for rds mysql"
  vpc_id      = var.vpc_id

  ingress {
    description     = "mysql from kubernetes"
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [aws_security_group.k8s.id]
  }

  egress {
    description = "allow outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    name = "${var.project_name}-rds-sg"
  }
}