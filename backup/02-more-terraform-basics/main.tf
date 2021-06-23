variable "iam_user_name_prefix" {
    type = string
    default = "my_iam_user"
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
    count = 3
  name="${var.iam_user_name_prefix}_${count.index}"

}