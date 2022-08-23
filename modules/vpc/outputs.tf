output "vpc_id" {
    value = aws_vpc.vpc.id
}

output "public_subnet_az1" {
    value = aws_subnet.public_subnet_az1.id
}

output "public_subnet_az2" {
  value = aws_subnet.public_subnet_az2.id
}

output "private_subnet_az1" {
  value = aws_subnet.private_app_subnet_az1.id
}

output "private_subnet_az2" {
  value = aws_subnet.private_app_subnet_az2.id
}

output "ec2_security_group_id" {
    value = aws_security_group.ec2_security_group.id
}
