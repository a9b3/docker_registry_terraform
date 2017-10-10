variable "count" {
  default = 1
}
variable "image" {
  default = "ubuntu-16-04-x64"
}
variable "region" {
  default = "sfo1"
}
variable "size" {
  default = "512mb"
}
variable "do_ssh_fingerprint" {}

resource "digitalocean_droplet" "docker-registry" {
  count = "${var.count}"
  image = "${var.image}"
  name = "docker-registry-${count.index}"
  region = "${var.region}"
  size = "${var.size}"
  ssh_keys = [
    "${var.do_ssh_fingerprint}"
  ]
}

output "public_ips" {
  value = ["${digitalocean_droplet.docker-registry.*.ipv4_address}"]
}

output "private_ips" {
  value = ["${digitalocean_droplet.docker-registry.*.ipv4_address_private}"]
}
