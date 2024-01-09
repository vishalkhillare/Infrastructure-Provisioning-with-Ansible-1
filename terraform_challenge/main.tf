provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "web_server" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"

  tags = {
    Name = "web-server-instance"
  }

  security_group = aws_security_group.web_sg.id
}

resource "aws_security_group" "web_sg" {
  name        = "web_sg"
  description = "Security group for the web server instance"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_db_instance" "rds_database" {
  identifier           = "rds-database-instance"
  instance_class       = "db.t2.micro"
  engine               = "mysql"
  allocated_storage    = 10
  storage_type         = "gp2"
  username             = "dbuser"
  password             = "Admin123"
  publicly_accessible = false

  vpc_security_group_ids = [aws_security_group.web_sg.id]
}

