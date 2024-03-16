resource "aws_route_table" "public-route-table" {
  vpc_id = aws_vpc.midterm-vpc.id
  tags = {
    Name = "Public-Route-Table"
  }
}

resource "aws_route_table" "public-route-table-2" {
  vpc_id = aws_vpc.midterm-vpc.id
  tags = {
    Name = "Public-Route-Table 2"
  }
}

resource "aws_route_table" "private-route-table" {
  vpc_id = aws_vpc.midterm-vpc.id
  tags = {
    Name = "Private-Route-Table"
  }
}