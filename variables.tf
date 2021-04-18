variable project_id {
  description = "The project ID to host the cluster in"
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
//variable cluster_name {
//  description = "Default cluster name preffix"
//  default     = "c1"
//}
variable kubernetes_version {
  default     = ""
}
variable workers_count {
  default     = 2
}

//variable "network" {
//  description = "The VPC network created to host the cluster in"
//  default     = "gke-network"
//}
//variable "subnetwork" {
//  description = "The subnetwork created to host the cluster in"
//  default     = "gke-subnet"
//}
//variable "ip_range_pods_name" {
//  description = "The secondary ip range to use for pods"
//  default     = "ip-range-pods"
//}
//variable "ip_range_services_name" {
//  description = "The secondary ip range to use for services"
//  default     = "ip-range-services"
//}

variable subnet_ip_cidr_range {
  description = "Subnet default ip range"
  type        = string
  default     = "10.10.0.0/24"
}

//variable "kubernetes_version" {
//  default     = ""
//}
//
//variable "workers_count" {
//  default     = 2
//}
//variable subnet_ip_cidr_range {
//  description = "Subnet default ip range"
//  type        = string
//  default     = "10.10.0.0/24"
//}
