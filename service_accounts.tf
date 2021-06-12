resource "google_service_account" "default" {
  account_id   = "${local.cluster_prefix}-default-id"
  display_name = "GKE Service Account"
}
