module "vpc" {
  source = "../modules/vpc"
  env    = var.env
  aws_info = var.prod
}

module "resourcegroup" {
  source = "../modules/resource_group"
  env    = var.env
}

module "iam" {
  source = "../modules/iam"
  env    = var.env
  policy = file("${path.module}/prod_policy.json")
}

module "sg" {
  source = "../modules/security_group"
  vpc_id = module.vpc.vpc_id
  env    = var.env
  sg_name = var.prod_security_name
  custom_rules = var.prod_security_rules
}