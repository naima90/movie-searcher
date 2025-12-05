terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 6.0"
    }
  }

  backend "s3" {
    bucket = "terraform-state-bucket-naima"
    key = "infra/terraform.tfstate"
    region = "eu-west-2"
    encrypt = true
  }
}

provider "aws" {
  region = var.aws_region
}