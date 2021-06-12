variable "region" {
  default     = "europe-west1"
  type = string
  description = "region"
}

variable "project_id" {
  description = "project name"
  type = string
}

variable "name" {
  description = "cluster name"
  type = string
}

variable "env" {
  default     = "staging"
  type = string
  description = "env name"
}

variable "node_count" {
  default = 1
  type = number
  description = "node count"
}

variable "pods_range" {
  default = "172.30.0.0/16"
  type = string
  description = "node secondary ip range"
}

variable "services_range" {
  default = "172.20.0.0/16"
  type = string
  description = "services secondary ip range"
}
