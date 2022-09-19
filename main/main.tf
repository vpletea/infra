terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "home-lab"

    workspaces {
      name = "main-srv"
    }
  }
}

resource "random_password" "password" {
  length      = 12
  special     = false
  min_lower   = 2
  min_upper   = 2
  min_numeric = 2
}

module "main" {
  source      = "../common/modules/vm"
  vm_id       = 110
  vm_name     = "main-srv"
  cores       = 3
  memory      = 8192
  disk_size   = "650G"
  username    = var.username
  cipassword  = random_password.password.result
  tag         = var.tag
  ssh_key     = var.ssh_key
  pm_api_url  = var.pm_api_url
  pm_user     = var.pm_user
  pm_password = var.pm_password
}