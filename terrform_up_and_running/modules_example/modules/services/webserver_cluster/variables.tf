variable "server_port" {
  default = 80
}

variable "cluster_name" {
  description = "the name used for all the clusters"
  type = string
}

variable "db_remote_state_bucket" {
  description = "the name of s3 bucket used to point db's tf-remote-state"
  type = string
}

variable "db_remote_state_key" {
  description = "path to reach the tf-remote-state db"
  type = string
}
