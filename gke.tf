data google_compute_zones available {
}
resource random_id cluster_name {
  byte_length = 4
}
resource random_id username {
  byte_length = 14
}
resource random_id password {
  byte_length = 16
}
data google_container_engine_versions supported {
  location           = data.google_compute_zones.available.names[0]
  version_prefix = var.kubernetes_version
}

resource google_container_cluster primary {
  name               = "${var.env}-${random_id.cluster_name.hex}"
  location           = var.region
  initial_node_count = var.workers_count
  network            = google_compute_network.vpc.name
  subnetwork         = google_compute_subnetwork.subnet.name
  node_version       = data.google_container_engine_versions.supported.latest_node_version
  min_master_version = data.google_container_engine_versions.supported.latest_master_version
  node_locations     = [
    data.google_compute_zones.available.names[1],
  ]
  master_auth {
    username         = random_id.username.hex
    password         = random_id.password.hex
    client_certificate_config {
      issue_client_certificate = true
    }
  }
  node_config {
    machine_type     = "n1-standard-1"
    oauth_scopes     = [
      "https://www.googleapis.com/auth/compute",
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
      "https://www.googleapis.com/auth/ndev.clouddns.readwrite",
    ]
  }
}

module gke_auth {
  source                  = "terraform-google-modules/kubernetes-engine/google//modules/auth"
  depends_on              = [google_container_cluster.primary]
  project_id              = var.project_id
  location                = var.region
  cluster_name            = google_container_cluster.primary.name
}
resource local_file kubeconfig {
  content                 = module.gke_auth.kubeconfig_raw
  filename                = "kubeconfig-${var.env}"
}
