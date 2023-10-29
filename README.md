# README
## This is an example of installing and running the nginx webserver mainline version using Terraform on the DigitalOcean provider, with the following assumptions:
- SSH Keys have already been created and uploaded to DigitalOcean
- A Personal Access Token (PAT) has already been generated
- The DigitalOcean API Slugs are known from Slugs DO
- Terraform is already installed (I am using Rocky Linux 9)
- The Terraform environment variable configuration for DigitalOcean is known

## There are two files:
- provider.tf
- webservertest.tf

## How to run
1. After creating all the above files in one folder, execute this command `terraform init`
2. Execute `terraform plan` to verify the plan is correct
3. Once step 2 checks out, execute `terraform apply -auto-approve` to approve everything since 100 instances will be created

### Optional:
- Don't forget to execute `terraform output -json droplet_ip_addresses` to output the name and public IP of each droplet into a JSON file. This simplifies creating configuration files for server deployment to enable automated distribution of the application to all servers, for example on push or PR triggers (Deployment Matrix)
