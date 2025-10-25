# Terraform Settings Block
terraform {
  required_version = ">= 0.13.0"
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.18.0"
    }
  }
}

# Terraform Provider Block
provider "aws" {
  region = "us-east-1"
}