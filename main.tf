provider "aws" {
  region = "us-east-1"
}

module "main_vpc" {
  source = "./modules/vpc"
vpc_cidr  = var.vpc_cidr
}

module "ec2-instance" {
  source = "./modules/ec2"

  image_id      = var.image_id
  instance_type = var.instance_type
  key_pair      = var.key_pair

  vpc_id        = module.main_vpc.vpc_id
  subnet_id     = module.main_vpc.public_subnets_cidr
}