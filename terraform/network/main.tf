resource "google_compute_address" "rtmp" {
  name = "rtmp-address"

  project = var.project_id
  region = "us-west1"
}