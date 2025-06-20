# Terraform_Project_Trial

This Terraform project automates the deployment of EC2 instances on AWS with Apache and Nginx web servers.

## Features

- Deploys multiple EC2 instances with customizable count
- Installs and configures both Apache (port 80) and Nginx (port 8080)
- Automatically provisions web content
- Outputs instance information (IPs, DNS, instance type)

## Prerequisites

- Terraform installed (v1.0+ recommended)
- AWS account with configured credentials
- SSH key pair (default: `bib-key-june`)

## Usage

1. Clone the repository:
   ```bash
   git clone https://github.com/tba87/Terraform_Project_Trial.git
   cd Terraform_Project_Trial

## Variables

| Variable             | Description                              | Default                     |
|----------------------|------------------------------------------|-----------------------------|
| `aws_region`         | AWS region where resources will be created | `us-east-1`                |
| `image_id`           | AMI ID for the EC2 instance              | `ami-020cba7c55df1f615`    |
| `ec2_instance_count` | Number of EC2 instances to deploy        | `2`                        |
| `instance_type`      | Type of EC2 instance                     | `t2.micro`                 |

## Outputs

| 'Public IP addresses' |
| 'Private DNS names'   |
| 'Instance types'      |