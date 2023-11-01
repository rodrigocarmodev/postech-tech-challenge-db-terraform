provider "aws" {
  region = "us-east-1"  # Substitua pela região desejada
}

resource "aws_db_instance" "mysql_instance" {
  identifier           = "my-mysql-db"
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  name                 = "mydatabase"
  username             = "admin"
  password             = "your_password_here"
  
  # Configurações adicionais
  publicly_accessible = false
  multi_az            = false
  backup_retention_period = 7

  # Subnet group
  vpc_security_group_ids = ["sg-0123456789abcdef0"]  # Substitua pelo ID do seu grupo de segurança
  subnet_group_name      = "my-subnet-group"
  
  # Parâmetros de configuração do banco de dados
  parameter_group_name = "default.mysql5.7"
}

output "db_endpoint" {
  value = aws_db_instance.mysql_instance.endpoint
}
