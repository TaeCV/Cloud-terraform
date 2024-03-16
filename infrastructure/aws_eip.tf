resource "aws_eip" "elastic-ip-for-nat-gw" {
  associate_with_private_ip = "10.0.2.5"
  domain                    = "vpc"

  tags = {
    Name = "EIP-NAT-GW"
  }
}

resource "aws_eip" "elastic-ip-for-wordpress" {
  associate_with_private_ip = "10.0.1.6"
  domain                    = "vpc"

  tags = {
    Name = "EIP-WORDPRESS"
  }
}

resource "aws_eip_association" "eip_assoc" {
  allocation_id        = aws_eip.elastic-ip-for-wordpress.id
  network_interface_id = aws_network_interface.ec2-public.id
}