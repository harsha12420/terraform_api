output "ec2_id" {
    value = aws_instance.web.id
}

output "ec2_pub_ip" {
  value = aws_instance.web.public_ip
}