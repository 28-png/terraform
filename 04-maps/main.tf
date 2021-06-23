variable "users" {
  default = {
    matt : { country : "Netherlands", departments : "ABC" },
    pat : { country : "US", departments : "DEF" },
    tom : { country : "India", departments : "XYZ" }
  }
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.46.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
  # VERSION IS NOT NEEDED HERE
}


resource "aws_iam_user" "my_iam_user" {
  for_each = var.users
  name     = each.key
  tags = {
    country : each.value.country
    departments : each.value.departments
  }

}