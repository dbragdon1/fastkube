variable "hcloud_token" {
  sensitive = true
}

provider "hcloud" {
  token = var.hcloud_token
}

resource "hcloud_ssh_key" "ssh_key" {
  name = "terraform ssh key"
  public_key = file("~/.ssh/hetzner.pub")
}

resource "hcloud_server" "server" {
  name = "terraform-server"
  image = "debian-12"
  server_type = "cpx11"
  location = "hil"
  ssh_keys = [hcloud_ssh_key.ssh_key.name]

  public_net {
    ipv4_enabled = true
    ipv6_enabled = true
  }
}

output "instance_ip_addr" {
  value = hcloud_server.server.ipv4_address
}
