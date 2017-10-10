variable "do_token" {
  description = "DigitalOcean access token"
}
variable "do_ssh_fingerprint" {
  description = "DigitalOcean ssh fingerprint"
}

provider "digitalocean" {
  token = "${var.do_token}"
}

module "docker_registry" {
  source = "./modules/docker_registry"
  do_ssh_fingerprint = "${var.do_ssh_fingerprint}"
}

output "docker_registry" {
  value = "${module.docker_registry.public_ips}"
}
