module gke {
  source      = "./modules/gke"
  project     = var.project_id
  region      = var.region
  env         = var.env
}
