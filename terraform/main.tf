variable "do_token" {
  description = "DigitalOcean access token"
}

provider "digitalocean" {
  token = "${var.do_token}"
}

module "docker_registry" {
  source = "./modules/docker_registry"
}

output "docker_registry" {
  value = "${module.docker_registry.public_ips}"
}
