# AWS Credentials
provider "aws"{
  access_key = "AK2EDILQ7"
  secret_key = "L22QMqawY5ieJpLz"
  region     = var.aws_region
}

# For alias
provider "aws"{
  region = "ap-south-2"
  alias  = "hyd"
}



terraform {
  required_version = "<= v1.3.9" #Forcing which version of Terraform needs to be used
  required_providers {
    aws = {
      version = "<= 5.0.0" #Forcing which version of plugin needs to be used.
      source  = "hashicorp/aws"
    }
  }
}
