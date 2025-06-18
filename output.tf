output "my_ec2_instance_ip" {
    value = aws_instance.my_ec2_instance.public_ip
}

output "my_ec2_instance_privatedns" {
    value = aws_instance.my_ec2_instance.private_dns
}

output "my_ec2_instance_type" {
    value = aws_instance.my_ec2_instance.instance_type
}