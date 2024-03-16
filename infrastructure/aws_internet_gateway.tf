resource "aws_internet_gateway" "midterm-igw" {
  vpc_id = aws_vpc.midterm-vpc.id

  tags = {
    Name = "Midterm-IGW"
  }
}

resource "aws_route" "public-internet-gw-route" {
  route_table_id         = aws_route_table.public-route-table.id
  gateway_id             = aws_internet_gateway.midterm-igw.id
  destination_cidr_block = "0.0.0.0/0"
}

resource "aws_route" "public-internet-gw-route-2" {
  route_table_id         = aws_route_table.public-route-table-2.id
  gateway_id             = aws_internet_gateway.midterm-igw.id
  destination_cidr_block = "0.0.0.0/0"
}