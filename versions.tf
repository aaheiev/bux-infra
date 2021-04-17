terraform {
  required_version = "~> 0.14"
  required_providers {
    google = {
      source  = "hashicorp/google"
    }
    google-beta = "~> 3.23.0"
    random      = "~> 2.2"
    kubernetes  = "~> 1.11"
    helm        = "~> 1.2"
    null        = "~> 2.1"
  }
}
