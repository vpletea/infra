terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "home-lab"

    workspaces {
      name = "dev-srv"
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

module "dev" {
  source      = "../common/modules/vm"
  vm_id       = 100
  vm_name     = "dev-srv"
  cores       = 2
  memory      = 4096
  disk_size   = "64G"
  username    = var.username
  cipassword  = random_password.password.result
  tag         = var.tag
  ssh_key     = var.ssh_key
  pm_api_url  = var.pm_api_url
  pm_user     = var.pm_user
  pm_password = var.pm_password
}
