data "template_file" "init-wordpress" {
  template = file("${path.module}/sh/wordpress.sh")
  vars = {
    database_name       = var.database_name
    database_user       = var.database_user
    database_pass       = var.database_pass
    private_ip          = aws_network_interface.db-private.private_ip
    wordpress_public_ip = aws_eip.elastic-ip-for-wordpress.public_ip
    admin_user          = var.admin_user
    admin_pass          = var.admin_pass
    access_key          = aws_iam_access_key.wordpress-s3-user-access-key.id
    secret_key          = aws_iam_access_key.wordpress-s3-user-access-key.secret
    s3_bucket_name      = aws_s3_bucket.media_bucket.id
    s3_bucket_region    = aws_s3_bucket.media_bucket.region
  }
}

data "template_file" "init-mariadb" {
  template = file("${path.module}/sh/db.sh")
  vars = {
    database_name = var.database_name
    database_user = var.database_user
    database_pass = var.database_pass
    private_ip    = aws_network_interface.ec2-private.private_ip
  }
}