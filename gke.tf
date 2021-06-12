resource "google_container_cluster" "primary" {
  name     = "${local.project_prefix}-gke"
  location = var.region

  remove_default_node_pool = true
  initial_node_count       = 1
  network                  = google_compute_network.vpc.name
  subnetwork               = google_compute_subnetwork.subnet.name
}

resource "google_container_node_pool" "primary_nodes" {
  name       = "${google_container_cluster.primary.name}-node-pool"
  location   = var.region
  cluster    = google_container_cluster.primary.name
  node_count = 1

  node_config {
    preemptible     = true
    machine_type    = "e2-micro"
    service_account = google_service_account.default.email
    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
      "https://www.googleapis.com/auth/cloud-platform",
    ]
    tags = ["gke-node", "${local.project_prefix}-gke"]
    metadata = {
      disable-legacy-endpoints = "true"
    }
    labels = {
      env     = var.env
      project = var.project_id
    }
  }
}

