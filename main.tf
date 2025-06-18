terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.0.0-beta3"
    }
  }
}

provider "aws" {
  # Configuration options
    region = var.aws_region

}

resource "aws_instance" "my_ec2_instance" {
    ami = var.image_id
    instance_type = var.instance_type
    tags = {
        Name = "Webservices"
    }
}

