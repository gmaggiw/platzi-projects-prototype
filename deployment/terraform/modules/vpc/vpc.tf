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

