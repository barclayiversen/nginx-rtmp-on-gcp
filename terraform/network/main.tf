resource "google_compute_address" "static" {
  name = "rtmp-address"

  project = var.project_id
  region = "us-west1"
}