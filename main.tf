terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.0.0-beta3"
    }
  }

  backend "s3" {
    bucket = "my-bucket-test-bibek"
    key = "terraform-state/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  # Configuration options
    region = var.aws_region

}

resource "aws_instance" "my_ec2_instance" {
    count = var.ec2_instance_count
    ami = var.image_id
    instance_type = var.instance_type
    tags = {
        Name = "Webservices"
    }
}

