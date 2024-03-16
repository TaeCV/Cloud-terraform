resource "aws_vpc" "midterm-vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "Midterm-VPC"
  }
}