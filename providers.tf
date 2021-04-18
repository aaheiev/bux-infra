provider google {
  project     = var.project_id
  region      = var.region
}

provider google-beta {
  project     = var.project_id
  region      = var.region
}
# The Helm provider
provider "helm" {
  kubernetes {
    config_path = "kubeconfig-${var.env}"
  }
}

# The Null Provider
//provider null {
//}
