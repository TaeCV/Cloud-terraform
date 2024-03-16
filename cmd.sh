terraform destroy -auto-approve
terraform plan -out plan.tfplan
terraform apply -auto-approve plan.tfplan

cat /var/log/cloud-init-output.log
tail -50 /var/log/cloud-init-output.log

sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
sudo yum -y install terraform