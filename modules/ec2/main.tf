resource "aws_instance" "web" {
  ami           = var.ec2_ami
  instance_type = var.ec2_type
  subnet_id =  var.subnet_id
  key_name        = var.key_name
  vpc_security_group_ids = [var.ec2_security_group_id]
  #key_name= var.key_name
  tags = {
    Name = var.ec2_name
  }
}
resource "aws_eip" "lb" {
  instance = aws_instance.web.id
  vpc      = true
}