
data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }

  filter {
    name   = "state"
    values = ["available"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}

resource "aws_instance" "control_plane" {
  ami                    = data.aws_ami.amazon_linux.id
  instance_type          = var.instance_type
  subnet_id              = var.private_app_subnet_ids[0]
  vpc_security_group_ids = [var.security_group_id]

  associate_public_ip_address = false

  root_block_device {
    encrypted   = true
    volume_type = "gp3"
    volume_size = 20
  }

  tags = {
    Name = "${var.project_name}-control-plane"
    Role = "control-plane"
  }
}

resource "aws_instance" "worker" {
  ami                    = data.aws_ami.amazon_linux.id
  instance_type          = var.instance_type
  subnet_id              = var.private_app_subnet_ids[1]
  vpc_security_group_ids = [var.security_group_id]

  associate_public_ip_address = false

  root_block_device {
    encrypted   = true
    volume_type = "gp3"
    volume_size = 20
  }

  tags = {
    Name = "${var.project_name}-worker"
    Role = "worker"
  }
}
