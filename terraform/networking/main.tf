
/*
    CIDR stands for Classless Inter-Domain Routing, which is an IP 
    address allocation method that enhances data routing efficiency. 
    CIDR notation is used in IP addressing to define a range of IP addresses.
*/
variable "vpc_cidr" {}
variable "vpc_name" {}
variable "cidr_public_subnet" {}
variable "cidr_private_subnet" {}
variable "eu_availability_zone" {}


###########
# EXPORTS #
###########

output "dev_bookyland_vpc_id" {
  value       =  aws_vpc.dev_bookyland_vpc_us_central_1.id
  description = "Bookyland VPC"
}

output "dev_bookylandpublic_subnet" {
    value =  aws_subnet.dev_bookyland_public_subnet.*.id
}

output "public_subnet_cidr_block" {
    value = aws_subnet.dev_bookyland_public_subnet.*.cidr_block
}


##########
# SETUPS #
##########

# VPC
resource "aws_vpc" "dev_bookyland_vpc_us_central_1" {
    cidr_block = var.vpc_cidr
    tags = {
        Name = var.vpc_name
    }
}

# Public subnet
resource "aws_subnet" "dev_bookyland_public_subnet" {
    count = length(var.cidr_public_subnet)
    vpc_id = aws_vpc.dev_bookyland_vpc_us_central_1.id
    cidr_block = element(var.cidr_public_subnet, count.index)
    availability_zone = element(var.eu_availability_zone, count.index)
    tags = {
    Name = "dev-bookyland-public-subnet-${count.index + 1}"
  }
}

# Private subnet
resource "aws_subnet" "dev_bookyland_private_subnet" {
    count = length(var.cidr_private_subnet)
    vpc_id = aws_vpc.dev_bookyland_vpc_us_central_1.id
    cidr_block = element(var.cidr_private_subnet, count.index)
    availability_zone = element(var.eu_availability_zone, count.index)
    tags = {
    Name = "dev-bookyland-private-subnet-${count.index + 1}"
  }
}
