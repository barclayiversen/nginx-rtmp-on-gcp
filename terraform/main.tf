resource "google_compute_instance" "default" {
  name         = "test"
  machine_type = "g1-small"
  zone         = "us-west1-b"
  project = "mixfreely"

  tags = ["obs", "rtmp", "http-server", "https-server"]

  boot_disk {
    initialize_params {
      image = "projects/mixfreely/global/images/family/nginx-rtmp"
      type = "pd-ssd"
    }

  }

  network_interface {
    network = "default"

    access_config {

    }
  }

  metadata = {}


  service_account {
    scopes = ["userinfo-email", "compute-ro", "storage-ro"]
  }
}
