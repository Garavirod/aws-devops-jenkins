/*

sECURITY GROUP: 

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


