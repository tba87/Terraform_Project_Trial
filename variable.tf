#input variables
variable "aws_region" {
  description = "AWS resource region were it would be created"
  type = string
  default = "us-east-1"
}

variable "image_id" {
  description = "AMI Id"
  type = string
  default = "ami-020cba7c55df1f615"
}

variable "ec2_instance_count" {
    description = "EC2 Instance Count"
    type = number
    default = 2
}

variable "instance_type" {
    description = "EC2 Instance Type"
    type = string
    default = "t2.micro"
}