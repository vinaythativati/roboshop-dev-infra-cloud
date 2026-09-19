terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.48.0"
    }
  }
  backend "s3" {
    bucket         = "one-b-kj"
    key            = "database04/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    use_lockfile   = true # Recommended for Terraform 1.10+ (Native S3 Locking)
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

