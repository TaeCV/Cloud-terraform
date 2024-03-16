resource "aws_instance" "Midterm-wordpress" {
  ami           = var.ami
  instance_type = "t2.micro"
  key_name      = aws_key_pair.midterm-key-pair.key_name

  network_interface {
    network_interface_id = aws_network_interface.ec2-public.id
    device_index         = 0
  }
  network_interface {
    network_interface_id = aws_network_interface.ec2-private.id
    device_index         = 1
  }

  user_data = data.template_file.init-wordpress.rendered

  tags = {
    Name = "Midterm-Wordpress"
  }
}

resource "aws_instance" "Midterm-mariadb" {
  ami           = var.ami
  instance_type = "t2.micro"
  key_name      = aws_key_pair.midterm-key-pair.key_name

  network_interface {
    network_interface_id = aws_network_interface.db-private-2.id
    device_index         = 0
  }
  network_interface {
    network_interface_id = aws_network_interface.db-private.id
    device_index         = 1
  }

  user_data = data.template_file.init-mariadb.rendered

  tags = {
    Name = "Midterm-MariaDB"
  }
}
