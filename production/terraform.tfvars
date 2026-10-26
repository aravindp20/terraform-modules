aws_region = "ap-south-2"
vpc_cidr   = "192.168.0.0/16"
vpc_name   = "devsecops-vpc"
IGW_name   = "igw-vpc"
# key_name   = "main-key"
azs = ["ap-south-2a", "ap-south-2b", "ap-south-2c"]

public_cidr_block  = ["192.168.1.0/24", "192.168.2.0/24", "192.168.3.0/24"]
private_cidr_block = ["192.168.10.0/24", "192.168.20.0/24", "192.168.30.0/24"]
environment        = "Prod"
# environment = "Dev"
# ingress_value = ["80", "8080", "443", "8443", "22", "3306", "1900", "1443"]
# amis = {
#   ap-south-2 = "ami-0c24c764e44ed98f2"
#   us-east-1  = "ami-0d97d7f07b25dd693"
# }