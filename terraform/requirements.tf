# main.tf

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
         version = "=5.47.0"
    }
  }
}

# AWS provider configuration
provider "aws" {
  region = var.region
}
