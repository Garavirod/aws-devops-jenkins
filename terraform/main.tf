module "networking" {
  source               = "./networking"
  vpc_cidr             = var.vpc_cidr
  vpc_name             = var.vpc_name
  cidr_public_subnet   = var.cidr_public_subnet
  eu_availability_zone = var.eu_availability_zone
  cidr_private_subnet  = var.cidr_private_subnet
}
module "security_group" {
  source = "./security-groups"
  ec2_sg_name = "Security group for EC2 to enable SSH(22), HTTPS(443) AND HTTP(80)"
  vpc_id = module.networking.dev_bookyland_vpc_id
  ec2_jenkins_sg_name = "Allow port 8080 for Jenkins"
}