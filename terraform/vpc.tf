

module "vpc" {
source  = "terraform-aws-modules/vpc/aws"
version = "~>6"
name = "ecs-vpc"
cidr = "10.0.0.0/16"
azs = ["ca-central-1a","ca-central-1b","ca-central-1d"]
private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]

enable_nat_gateway = true
single_nat_gateway  = true
one_nat_gateway_per_az = false
 
}

