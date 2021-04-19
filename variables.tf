variable project_id {
  description = "The project ID to host the cluster in"
}
variable domain_name {
  description = "DNS domain name"
}
variable cert_admin {
  description = "TLS cert admin"
}
variable region {
  description = "The region to host the cluster in"
  default     = "europe-west1"
}
variable env {
  description = "Default resources preffix"
  default     = "demo"
}
variable dns_zone_name {
  description = "Environment dns zone name"
  default     = "asg12"
}
variable kubernetes_version {
  default     = ""
}
variable workers_count {
  default     = 2
}
variable subnet_ip_cidr_range {
  description = "Subnet default ip range"
  type        = string
  default     = "10.10.0.0/24"
}
