scp -i "cloud_act.pem" -r ./midterm/infrastructure  ec2-user@52.39.91.142:/home/ec2-user
ssh -i "cloud_act.pem" ec2-user@52.39.91.142
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
sudo yum -y install terraform
cd infrastructure
terraform init
terraform plan -out plan.tfplan
terraform apply -auto-approve plan.tfplan
terraform destroy -auto-approve