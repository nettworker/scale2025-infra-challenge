variable "cloud_id" {
  description = "YC cloud-id"
}

variable "folder_id" {
  description = "YC folder-id for the Default folder"
}

variable "zone_list" {
  type        = map(string)
  description = "Zones & Subnets list"
}

variable "user_name" {
  description = "VM's administrator user name"
  default     = "admin"
}
