module "vpc" {
  source="./modules/vpc"
  environment=var.environment
  vpc_cidr=var.vpc_cidr
  public_subnet_cidr=var.public_subnet_cidr
  availability_zone=var.availability_zone
}
module "ec2" {
  source="./modules/ec2"
  environment=var.environment
  ami_id=var.ami_id
  instance_type=var.instance_type
  subnet_id=module.vpc.public_subnet_id
  vpc_id=module.vpc.vpc_id
}
