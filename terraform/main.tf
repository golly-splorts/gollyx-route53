terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket  = "gollyx-tfstate"
    key     = "gollyx-route53/terraform.tfstate"
    region  = "us-west-1"
    encrypt = true
  }
}

# Route 53 is a global service; us-east-1 is standard.
provider "aws" {
  region = "us-east-1"
}
