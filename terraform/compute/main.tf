resource "google_compute_instance" "default" {
  project = var.project_id
  name         = "nginx-rtmp-tf"
  machine_type = "g1-small"
  zone         = "us-west1-b"

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
      nat_ip = data.terraform_remote_state.foundation.outputs.rtmp_ip
    }
  }

  metadata = {}


  service_account {
    scopes = ["userinfo-email", "compute-ro", "storage-ro"]
  }
}

resource "google_compute_firewall" "rtmp" {
  project = var.project_id
  name    = "allow-rtmp-tf"
  network = "default"
  
  allow {
    protocol = "tcp"
    ports    = ["1935"]
  }

  target_tags = ["rtmp"]
  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_firewall" "nofw" {
  project = var.project_id
  name    = "no-fw-tf"
  network = "default"
    
  allow {
    protocol = "all"
  }

  target_tags = ["obs"]
  source_ranges = []
}
