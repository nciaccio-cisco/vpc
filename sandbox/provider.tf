variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "aws_account_ids" {
  type    = list
  default = null
}

provider "aws" {
  region              = var.aws_region
  allowed_account_ids = var.aws_account_ids
}

terraform {
  required_version = ">= 0.12.20"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 2.46.0"
    }
  }
}