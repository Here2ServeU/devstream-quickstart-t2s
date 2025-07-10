
provider "google" {
  project = var.project
  region  = var.region
}

resource "google_container_cluster" "t2s_gke" {
  name     = var.cluster_name
  location = var.region

  initial_node_count = var.node_count

  node_config {
    machine_type = var.machine_type
  }
}
