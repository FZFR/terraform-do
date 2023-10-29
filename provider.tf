# Configure DigitalOcean provider 

terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "~> 2.31.0" # https://registry.terraform.io/providers/digitalocean/digitalocean
    }
  }
}

variable "do_token" {}
variable "pvt_key" {}

provider "digitalocean" {
  token = var.do_token
}

data "digitalocean_ssh_key" "terraform_ssh" {
  name = "terraform_ssh"
} 
