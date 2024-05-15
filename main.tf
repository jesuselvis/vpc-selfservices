terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region     = "us-east-1"
  profile = "devops"
}

module "vpc" {
  source = "git::ssh://git@bitbucket.org/anka-escuelita/jesus-aws-vpc.git"#no cambiar
  vpc_cidr_block = "10.0.0.0/16"
  subnet_cidr_block_pub = ["10.0.1.0/24"] #you can add two more subnets
  subnet_cidr_block_priv = ["10.0.2.0/24"]
  name = "vpc-main"
  azs = [ "us-east-1a"]
}