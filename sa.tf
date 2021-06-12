resource "google_service_account" "default" {
  account_id   = "gke-service-account-id"
  display_name = "GKE Service Account"
}
