# terraform aws db subnet group
resource "aws_db_subnet_group" "database-subnet-group" {
  name         = var.db_subnet_group_name
  subnet_ids   = [var.subnet_id_az1, var.subnet_id_az2]
  tags   = {
    Name = var.subnet_group_tag
  }
}



resource "aws_db_instance" "rds" { 
  allocated_storage    = var.allocated_storage
  engine               = var.engine
  engine_version       = var.engine_version
  instance_class       = var.instance_class
  db_name              = var.db_name
  username             = var.username
  password             = var.password
  skip_final_snapshot  = var.skip_final_snapshot
}

