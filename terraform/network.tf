resource "google_compute_network" "vpc" {
  name                    = "secure-vpc"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "web_subnet" {
  name          = "web-subnet"
  ip_cidr_range = "10.10.10.0/24"
  region        = var.region
  network       = google_compute_network.vpc.id

  log_config {
    aggregation_interval = "INTERVAL_5_SEC"
    flow_sampling        = 0.5
    metadata             = "INCLUDE_ALL_METADATA"
  }
}

resource "google_compute_subnetwork" "db_subnet" {
  name          = "db-subnet"
  ip_cidr_range = "10.10.20.0/24"
  region        = var.region
  network       = google_compute_network.vpc.id

  log_config {
    aggregation_interval = "INTERVAL_5_SEC"
    flow_sampling        = 0.5
    metadata             = "INCLUDE_ALL_METADATA"
  }
}