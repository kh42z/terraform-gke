variable "region" {
  default     = "europe-west1"
  type = string
  description = "region"
}

variable "project_id" {
  description = "project name"
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
