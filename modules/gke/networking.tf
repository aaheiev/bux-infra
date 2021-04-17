resource "google_compute_network" "vpc" {
  name                    = "${var.env}-vpc"
  auto_create_subnetworks = "false"
}
resource "google_compute_subnetwork" "subnet" {
  name          = "${var.env}-subnet"
  region        = var.region
  network       = google_compute_network.vpc.name
  ip_cidr_range = var.subnet_ip_cidr_range
}

