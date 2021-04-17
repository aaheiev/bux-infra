variable "project_id" {
  description = "The project ID to host the cluster in"
}
variable "region" {
  description = "The region to host the cluster in"
  default     = "europe-west1"
}
variable "env" {
  description = "Default resources preffix"
  default     = "demo"
}