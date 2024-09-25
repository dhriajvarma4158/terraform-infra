resource "aws_db_subnet_group" "db_subnet_group" {
  name       = "main-db-subnet-group"
  subnet_ids = [aws_subnet.secure_subnet.id]

  tags = {
    Name = "main-db-subnet-group"
  }
}

resource "aws_db_instance" "db_instance" {
  allocated_storage    = 20
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t2.micro"
  db_name              = "pet-clinic"
  username             = local.db_credentials["username"]
  password             = local.db_credentials["password"]
  parameter_group_name = "default.mysql8.0"
  skip_final_snapshot  = true
  publicly_accessible  = false
  multi_az             = true
  db_subnet_group_name = aws_db_subnet_group.db_subnet_group.name

  tags = {
    Name = "main-db-instance"
  }
}
