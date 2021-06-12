provider "google" {
  project = var.project_id
  region  = var.region
}

resource "google_compute_network" "vpc" {
  name                    = "${local.project_prefix}-vpc"
  auto_create_subnetworks = "false"
}

resource "google_compute_subnetwork" "subnet" {
  name          = "${local.project_prefix}-subnet"
  region        = var.region
  network       = google_compute_network.vpc.name
  ip_cidr_range = "172.16.0.0/24"
}