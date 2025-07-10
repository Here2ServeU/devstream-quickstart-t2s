
variable "project" {
  description = "GCP project ID"
  type        = string
}

variable "region" {
  description = "GCP region"
  type        = string
}

variable "cluster_name" {
  description = "GKE cluster name"
  type        = string
}

variable "node_count" {
  description = "Initial node count"
  type        = number
}

variable "machine_type" {
  description = "Machine type"
  type        = string
}
