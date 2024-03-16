resource "tls_private_key" "midterm-private-key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "midterm-key-pair" {
  key_name   = "midterm-key-pair"
  public_key = tls_private_key.midterm-private-key.public_key_openssh
}

output "private_key_pem" {
  value     = tls_private_key.midterm-private-key.private_key_pem
  sensitive = true
}
