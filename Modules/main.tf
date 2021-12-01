terraform {
  backend "s3" {
    bucket = "egtest-automation"
    key    = "eg-terraform/r21-vpc/EG00001"
    region = "us-west-2"
    dynamodb_table = "eg-terraform"
  }
  
  
required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = var.aws_region
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  name = var.vpc_name
  cidr = var.vpc_cidr
  tags = {
    Terraform = "true"
  }
}
  

