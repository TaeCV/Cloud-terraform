resource "aws_security_group" "midterm-app-external" {
  name        = "midterm-app-external"
  description = "Security group for Wordpress instance for external"

  vpc_id = aws_vpc.midterm-vpc.id

  # Inbound rule for HTTP (80)
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Inbound rule for SSH (22) 
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Egress rule to allow all outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "midterm-app-internal" {
  name        = "midterm-app-internal"
  description = "Security group for Wordpress instance for internal"

  vpc_id = aws_vpc.midterm-vpc.id

  # Inbound rule for HTTP (80)
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["10.0.3.0/24"]
  }

  # Egress rule to allow all outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "midterm-mariadb-internal" {
  name        = "midterm-mariadb-internal"
  description = "Security group for MariaDB instance for internal"

  vpc_id = aws_vpc.midterm-vpc.id

  # Inbound rule for MySQL (3306)
  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["10.0.3.0/24"]
  }

  # Egress rule to allow all outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


resource "aws_security_group" "midterm-mariadb-external" {
  name        = "midterm-mariadb-external"
  description = "Security group for MariaDB instance for external"

  vpc_id = aws_vpc.midterm-vpc.id

  # Egress rule to allow all outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
