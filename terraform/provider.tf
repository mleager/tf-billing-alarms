terraform {
  cloud {
    organization = "mleager"

    workspaces {
      name = "aws-cloudwatch-billing-alarms"
    }
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.99.1"
    }
  }
}

# Billing Alarms must be us-east-1 as per AWS Docs:
# https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/monitor_estimated_charges_with_cloudwatch.html
provider "aws" {
  region = "us-east-1"
  default_tags {
    tags = {
      Environment = var.environment
      Deployment  = "Terraform"
      Region      = "us-east-1"
    }
  }
}

