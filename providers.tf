provider google {
  project       = var.project_id
  region        = var.region
}

provider google-beta {
  project       = var.project_id
  region        = var.region
}

provider helm {
  kubernetes {
    config_path = "kubeconfig-${var.env}"
  }
}
provider kubernetes {
  config_path   = "kubeconfig-${var.env}"
}
