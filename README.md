# README

## This is an example of installing and running the Nginx webserver mainline version using Terraform on the DigitalOcean provider, with the following assumptions:
- SSH keys have already been created and uploaded to DigitalOcean.
- A Personal Access Token (PAT) has already been generated.
- The DigitalOcean API Slugs are known from [Slugs DO](https://slugs.do-api.dev/)
- Terraform is already installed.
- You have already configured the Terraform environment variables for DigitalOcean.

## There are two files:
- `provider.tf`
- `webservertest.tf`

## How to run
1. After creating all the above files in one folder, execute this command: `terraform init`.
2. Run `terraform plan` to verify that the plan is correct.
3. Once step 2 checks out, execute `terraform apply -auto-approve` to approve everything, as 100 instances will be created.

### Optional:
- Don't forget to execute `terraform output -json droplet_ip_addresses` to output the name and public IP of each droplet into a JSON file. This simplifies creating configuration files for server deployment to enable automated distribution of the application to all servers, for example, on push or PR triggers (Deployment Matrix).

