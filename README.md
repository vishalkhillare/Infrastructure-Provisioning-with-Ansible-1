# Infrastructure-Provisioning-with-Ansible
1. Run `terraform init` and `terraform apply` in the `terraform_challenge` directory to create the infrastructure.

2. Update the `inventory.ini` file with the EC2 instance public IP.

3. Run `ansible-playbook -i inventory.ini web_server.yml` to provision the web server.

4. Run `ansible-playbook -i inventory.ini rds_database.yml` to provision the RDS database.
