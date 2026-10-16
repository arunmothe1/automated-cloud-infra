module "vpc" {
  source = "./modules/vpc"

  project_name             = var.project_name
  vpc_cidr                 = var.vpc_cidr
  availability_zones       = var.availability_zones
  public_subnet_cidrs      = var.public_subnet_cidrs
  private_app_subnet_cidrs = var.private_app_subnet_cidrs
  private_db_subnet_cidrs  = var.private_db_subnet_cidrs
}

module "jenkins" {
  source = "./modules/jenkins"

  project_name      = var.project_name
  subnet_id         = module.vpc.public_subnet_ids[0]
  security_group_id = module.security_groups.jenkins_sg_id

  instance_type = "t3.micro"
  key_name      = var.key_name
}


module "security_groups" {
  source = "./modules/security-groups"

  project_name = var.project_name
  vpc_id       = module.vpc.vpc_id
  vpc_cidr     = var.vpc_cidr
  admin_ip     = var.admin_ip
}

module "ecr" {
  source = "./modules/ecr"

  project_name = var.project_name
}


module "kubernetes" {
  source = "./modules/kubernetes"

  project_name           = var.project_name
  private_app_subnet_ids = module.vpc.private_app_subnet_ids
  security_group_id      = module.security_groups.k8s_sg_id
  instance_type          = "t3.medium"
}