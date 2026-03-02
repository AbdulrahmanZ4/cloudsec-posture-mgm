resource "google_compute_instance" "web" {
  name         = "web-1"
  machine_type = "e2-medium"
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.web_subnet.id

    access_config {} # public IP for web tier
  }

  metadata = {
    enable-oslogin = "TRUE"
  }

  tags = ["web"]
}

resource "google_compute_instance" "db" {
  name         = "db-1"
  machine_type = "e2-medium"
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.db_subnet.id
    # no public IP
  }

  metadata = {
    enable-oslogin = "TRUE"
  }

  tags = ["db"]
}