provider "google" {
  project = var.project_id
  region  = var.region
}

resource "google_container_cluster" "primary" {
  name     = "corebanking-cluster"
  location = var.region
  initial_node_count = 3
  remove_default_node_pool = true
  lifecycle {
    ignore_changes = [initial_node_count]
  }
}

resource "google_container_node_pool" "primary_nodes" {
  name       = "corebanking-pool"
  cluster    = google_container_cluster.primary.name
  location   = var.region
  node_count = 3

  node_config {
    machine_type = "e2-medium"
    preemptible  = false
  }
}
