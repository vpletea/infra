variable "vm_id" {
  type = string
}

variable "vm_name" {
  type = string
}

variable "target_node" {
  type    = string
  default = "pve-srv"
}

variable "template" {
  type    = string
  default = "template"
}

variable "cores" {
  type    = string
  default = 1
}

variable "memory" {
  type    = string
  default = 2048
}

variable "disk_size" {
  type    = string
  default = "32G"
}

variable "vmbr" {
  type    = string
  default = "vmbr0"
}

variable "tag" {
  type = string
}
variable "username" {
  type = string
}

variable "cipassword" {
  type = string
}

variable "ssh_key" {
  type = string
}

variable "pm_api_url" {
  type = string
}

variable "pm_user" {
  type = string
}

variable "pm_password" {
  type = string
}

