terraform {
  required_providers {
    hcloud = {
      source = "hetznercloud/hcloud"
    }
  }
  cloud {
    organization = "ossScharom"

    workspaces {
      name = "caprover-hetzner"
    }
  }
}

variable "hcloud_token" {
  sensitive = true
}

variable "public_key_0" {
  sensitive = true
}
variable "public_key_1" {
  sensitive = true
}
variable "user_name" {
  sensitive = true
}

provider "hcloud" {
  token = var.hcloud_token
}

data "template_file" "provision_caprover" {
  template = file("./scripts/porvision_caprover.yaml")
  vars = {
    public_key_0 = var.public_key_0
    public_key_1 = var.public_key_1
    user_name    = var.user_name
  }
}

resource "hcloud_server" "node1" {
  name        = "node1"
  image       = "ubuntu-20.04"
  server_type = "cx11"
  location    = "nbg1"
  user_data   = data.template_file.provision_caprover.rendered
}
