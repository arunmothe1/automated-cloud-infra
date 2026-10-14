data "aws_ami" "amazon_linux" {
  most_recent = true

  owners = ["amazon"]

  filter {
    name   = "name"
    values = ["a12023-ami-*x86_64"]
  }

  filter {
    name   = "state"
    values = ["available"]
  }
}


resource "aws_instance" "Jenkins" {
  ami_id        = data.aws_ami.amazon_linux.id
  instance_type = var.instance_type

  subnet_id                    = var.subnet_id
  vpc_security_group_ids       = [var.vpc_security_group_ids]
  associate_public_ip_addraess = true

  key_name = var.key_name

  tags = {
    name = "${var.projet_name}-Jenkins"
  }
}