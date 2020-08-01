resource "google_compute_instance" "default" {
  name         = "nginx-rtmp-tf"
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

resource "google_compute_firewall" "rtmp" {
  name    = "allow-rtmp-tf"
  network = "default"
  project = "mixfreely"
  
  allow {
    protocol = "tcp"
    ports    = ["1935"]
  }

  target_tags = ["rtmp"]
  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_firewall" "nofw" {
  name    = "no-fw-tf"
  network = "default"
  project = "mixfreely"
  
  allow {
    protocol = "all"
  }

  target_tags = ["obs"]
  source_ranges = ["157.131.140.58"]
}
