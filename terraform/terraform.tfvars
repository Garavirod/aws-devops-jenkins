bucket_name = "dev-bookyland-jenkins-remote-state-bucket-123456"

vpc_cidr             = "11.0.0.0/16"
vpc_name             = "dev-bokyland-jenkins-us-east-vpc-1"
cidr_public_subnet   = ["11.0.1.0/24", "11.0.2.0/24"]
cidr_private_subnet  = ["11.0.3.0/24", "11.0.4.0/24"]
eu_availability_zone = ["us-east-1a", "us-east-1b"]

public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCz+3NsJfc11jo4AUsX+FiTpmzF1ku1oAbxw4nPVdRghVOcMAQZdcuP2MGIbSZwUXkZJ1tfy9VOKJOuHoJ9rZZLJgE40rKEw8KfWcGNy9csF+DcQeoV6wKf1uQf+K71eFlh4qfgYnFfNCUsGQ3Jru1eXAybxvpMWg7EdjgsnRVcFDDfxrLjb4gFEj58MymXDrNkNolzNXeAeXi9yRVrXAU4lSZzfUy8E8Hw5DBdSn+djS3RdmVr2UbqjkNYnDeDMIQocqMTnAfOADeGZf+zZh8wXRnw/mDzA1jlVl41C1qv21dkKezJdrUWb7WYae0CJ+fIxgPxQE799BTVWeKp208Zbqj8VL7tUhjhoCYlQX9MBNTcCTsAKqHUhO+ktaefwwkCRFdLXeu7W2U6z45IYZu5iPSy12mgcwFu8oOoKmZVwXOXw1r0he6ZkqTM2p54GJgoaFO5QK9vXdclR2Do0h/wRyDqaV4TMatgYhwgjgVT96VPfiprqj0emSVsOn4uC5s= garavirod@Rodrigo"
ec2_ami_id = "ami-04b70fa74e45c3917"