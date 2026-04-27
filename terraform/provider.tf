

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>6"
    }
  }
  backend "s3"{
    bucket = "farhan-tf1281"
    region = "ca-central-1"
    key="vpc/terraform.tfstate"
  }
  
}

provider "aws" {
  region = var.aws_region
}

