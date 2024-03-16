resource "aws_network_interface" "ec2-public" {
  subnet_id       = aws_subnet.public-subnet-1.id
  description     = "ENI using for public route table"
  private_ip      = "10.0.1.5"
  security_groups = [aws_security_group.midterm-app-external.id]

  tags = {
    Name = "ENI-Wordpress-route-table"
  }
}

resource "aws_network_interface" "ec2-private" {
  subnet_id       = aws_subnet.private-subnet-1.id
  description     = "ENI using for internal communication between app and db"
  private_ip      = "10.0.3.5"
  security_groups = [aws_security_group.midterm-app-internal.id]

  tags = {
    Name = "ENI-Wordpress-internal"
  }
}

resource "aws_network_interface" "db-private" {
  subnet_id       = aws_subnet.private-subnet-1.id
  description     = "ENI using for internal communication between app and db"
  private_ip      = "10.0.3.6"
  security_groups = [aws_security_group.midterm-mariadb-internal.id]

  tags = {
    Name = "ENI-MariaDB-internal"
  }
}

resource "aws_network_interface" "db-private-2" {
  subnet_id       = aws_subnet.private-subnet-2.id
  description     = "ENI using for private route table"
  private_ip      = "10.0.4.5"
  security_groups = [aws_security_group.midterm-mariadb-external.id]

  tags = {
    Name = "ENI-MariaDB-route-table"
  }
}