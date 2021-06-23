variable "names" {
  default = ["ravs", "sats", "matt", "pat", "tom"]
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
    #count = length(var.names)
    #name = var.names[count.index]
    for_each = toset(var.names)
    name = each.value

}