/*

SECURITY GROUP: 

 virtual firewall for your EC2 instances, controlling both inbound 
 and outbound traffic at the instance level. crucial role in securing 
 your AWS resources by defining rules that specify the allowed protocols, 
 ports, and IP address ranges.

 They provide a way to control the traffic flow to and from your EC2 instances, 
 ensuring that only the desired traffic is allowed while protecting 
 your instances from unwanted access.

*/

variable "ec2_sg_name" {}
variable "vpc_id" {}
variable "ec2_jenkins_sg_name" {}


output "sg_ec2_ssh_id" {
  value = aws_security_group.ec2_sg_ssh_http.id
}

output "sg_ec2_jenkins_port_8080" {
  value = aws_security_group.ec2_jenkins_sg_port_8080.id
}


resource "aws_security_group" "ec2_sg_ssh_http" {
  name = var.ec2_sg_name
  description = "Enable port for HTTP(80) and SSH(22)"
  vpc_id = var.vpc_id

  ingress {
    description = "Allow remote ssh from anyware"
    cidr_blocks = ["0.0.0.0/0"]
    from_port = 22
    to_port = 22
    protocol = "tcp"
  }

  ingress {
    description = "Allow HTTP request from anywhere"
    cidr_blocks = ["0.0.0.0/0"]
    from_port = 80
    to_port = 80
    protocol = "tcp"
  }

  ingress {
    description = "Allow HTTP request from anywhere"
    cidr_blocks = ["0.0.0.0/0"]
    from_port = 443
    to_port = 443
    protocol = "tcp"
  }

   #Outgoing request
   egress {
    description = "Allow all the request outgoing from ec2"
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
   }

   tags = {
     Name = "Security Groups to allow SSH(22) and HTTP(80)"
   }
}

// Jenkins security group
resource "aws_security_group" "ec2_jenkins_sg_port_8080" {
  name = var.ec2_jenkins_sg_name
  description = "Enable the port 8080 for Jenkins"
  vpc_id = var.vpc_id

  ingress {
    description = "Allow the port 8080 for Jenkins"
    cidr_blocks = ["0.0.0.0/0"]
    from_port = 8080
    to_port = 8080
    protocol = "tcp"
  }

  tags = {
    Name = "Security Group to allow SSH(22) & HTTP(80)"
  }
}