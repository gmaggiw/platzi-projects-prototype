resource "aws_vpc" "main" {
  cidr_block = var.cidr_block
}

resource "aws_subnet" "subnet1" {
  vpc_id = aws_vpc.main.id

  availability_zone = var.subnet1_az
  cidr_block        = cidrsubnet(aws_vpc.main.cidr_block, 4, 1)
}


resource "aws_subnet" "subnet2" {
  vpc_id = aws_vpc.main.id

  availability_zone = var.subnet2_az
  cidr_block        = cidrsubnet(aws_vpc.main.cidr_block, 4, 2)
}

resource "aws_security_group" "sg1" {
  name        = "sg1"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "TLS from VPC"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.main.cidr_block]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}

resource "aws_security_group" "sg2" {
  name        = "sg2"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "TLS from VPC"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.main.cidr_block]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}