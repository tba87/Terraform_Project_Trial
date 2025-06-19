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
    key_name = "bib-key-june"
    instance_type = var.instance_type
    tags = {
        Name = "Webservices"
    }

  provisioner "file" {
    source = "conf/myapp.config"
    destination = "/home/ubuntu/myapp.config"
  }

  provisioner "file" {
    source = "conf/myapache.sh"
    destination = "/home/ubuntu/myapache.sh"
  }

  provisioner "file" {
    source = "conf/index.html"
    destination = "/home/ubuntu/index.html"
  }

  provisioner "local-exec" {
    command = "echo Private IP: ${self.private_ip} >> information.txt"
  }

  provisioner "local-exec" {
    command = "echo Public IP: ${self.public_ip} >> information.txt" 
  }

  provisioner "local-exec" {
    command = "echo Environment: $FOO $BAR $BAZ >> information.txt"
    environment = {
        FOO = "bar"
        BAR = 1
        BAZ = "true"
      }
  }
  
  connection {
    type = "ssh"
    user = "ubuntu"
    private_key = file("~/.ssh/bib-key-june.pem")
    host = self.public_ip
  }

}

