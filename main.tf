provider "aws" {
  region = "us-east-1"
}
module "vpc" {
  source = "./modules/vpc"

  vpc_cidr            = "10.0.0.0/15"
  public_subnet_cidr  = "172.16.0.1/20"
  private_subnet_cidr = "172.16.0.0/20"
}

module "ec2" {
  source = "./modules/ec2"

  image_id      = "ami-0ec10929233384c7f"
  instance_type = "t2.micro"
  key_pair      = "nv-new"

  vpc_id    = module.main_vpc.vpc_id
  subnet_id = module.main_vpc.public_subnet_id
}