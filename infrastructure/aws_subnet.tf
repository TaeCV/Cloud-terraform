resource "aws_subnet" "public-subnet-1" {
  cidr_block        = "10.0.1.0/24"
  vpc_id            = aws_vpc.midterm-vpc.id
  availability_zone = var.availability_zone

  tags = {
    Name = "Public-Subnet-1"
  }
}

resource "aws_subnet" "public-subnet-2" {
  cidr_block        = "10.0.2.0/24"
  vpc_id            = aws_vpc.midterm-vpc.id
  availability_zone = var.availability_zone

  tags = {
    Name = "Public-Subnet-2"
  }
}

resource "aws_subnet" "private-subnet-1" {
  cidr_block        = "10.0.3.0/24"
  vpc_id            = aws_vpc.midterm-vpc.id
  availability_zone = var.availability_zone

  tags = {
    Name = "Private-Subnet-1"
  }
}

resource "aws_subnet" "private-subnet-2" {
  cidr_block        = "10.0.4.0/24"
  vpc_id            = aws_vpc.midterm-vpc.id
  availability_zone = var.availability_zone

  tags = {
    Name = "Private-Subnet-2"
  }
}