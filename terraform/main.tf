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

module "jenkins" {
  source                    = "./jenkins"
  ami_id                    = var.ec2_ami_id
  instance_type             = "t2.medium"
  tag_name                  = "Jenkins:Ubuntu Linux EC2"
  public_key                = var.public_key
  subnet_id                 = tolist(module.networking.dev_bookylandpublic_subnets)[0]
  sg_for_jenkins            = [module.security_group.sg_ec2_ssh_id, module.security_group.sg_ec2_jenkins_port_8080]
  enable_public_ip_address  = true # because resides into public subnet
  user_data_install_jenkins = templatefile("./jenkins/jenkins-runner-script.sh", {}) # User data in order to configure EC2 (Blank as default)
}

module "tg-load-balancer" {
  source = "./target-load-balancer"
  lb_target_group_name = "jenkins-load-balancer-tg"
  lb_target_group_port = 8080
  lb_target_group_protocol = "HTTP"
  vpc_id = module.networking.dev_bookyland_vpc_id
  ec2_instance_id = module.jenkins.jenkins_ec2_instance_ip
}