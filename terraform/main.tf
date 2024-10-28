provider "hcloud" {
}

resource "hcloud_ssh_key" "ssh_key" {
  name = "terraform ssh key"
  public_key = file("~/.ssh/hetzner.pub")
}

resource "hcloud_server" "control-plane" {
  name = "control-plane"
  image = "debian-12"
  server_type = "cpx11"
  location = "hil"
  ssh_keys = [hcloud_ssh_key.ssh_key.name]

  public_net {
    ipv4_enabled = true
    ipv6_enabled = true
  }
}

resource "hcloud_server" "worker1" {
  name = "worker1"
  image = "debian-12"
  server_type = "cpx11"
  location = "hil"
  ssh_keys = [hcloud_ssh_key.ssh_key.name]

  public_net {
    ipv4_enabled = true
    ipv6_enabled = true
  }
}

output "control_plane_ip_addr" {
  value = hcloud_server.control-plane.ipv4_address
}

output "worker1_ip_addr" {
  value = hcloud_server.worker1.ipv4_address
}
