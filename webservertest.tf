resource "digitalocean_droplet" "webservertest" {
  count = 100 # create 100 instances
  image = "rockylinux-9-x64"
  name = "webservertest-${count.index}" # unique names
  region = "sgp1" # singapore
  size = "s-4vcpu-8gb-amd" # basic amd 4vcpu and 8gb ram
# All the data above can be obtained from here: https://slugs.do-api.dev/
  private_networking = true
  ssh_keys = [
    data.digitalocean_ssh_key.terraform_ssh.id
  ]
  connection {
    host = self.ipv4_address
    user = "root"
    type = "ssh"
    private_key = file(var.pvt_key)
    timeout = "2m"
  }
  output "droplet_ip_addresses" {
    value = {
      for droplet in digitalocean_droplet.webservertest:
      droplet.name => droplet.ipv4_address
    }
  }
  provisioner "remote-exec" {
    inline = [
      "export PATH=$PATH:/usr/bin",
      # update system to ensure all existing packages are up to date.
      "sudo dnf upgrade --refresh",      
      "sudo dnf install dnf-utils -y",
      "sudo tee /etc/yum.repos.d/nginx-mainline.repo <<-EOF
      [nginx-mainline]
      name=nginx mainline repo
      baseurl=http://nginx.org/packages/mainline/centos/9/x86_64/
      gpgcheck=1
      enabled=0
      gpgkey=https://nginx.org/keys/nginx_signing.key
      module_hotfixes=true
      EOF",
      "sudo yum-config-manager --enable nginx-mainline",
      "sudo dnf install nginx -y",
      "sudo systemctl enable nginx",
      "sudo systemctl start nginx"
    ]
  }
}
