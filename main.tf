resource "google_container_cluster" "cluster" {
  name     = var.cluster_name
  location = var.cluster_location

  network                  = var.network
  remove_default_node_pool = length(var.node_pools) > 0 ? true : false
  initial_node_count       = length(var.node_pools) > 0 ? 1 : var.initial_node_count

  dynamic "node_config" {
    for_each = length(var.tags) > 0 ? [1] : [0]
    content {
      tags = var.tags
    }
  }

}

resource "google_container_node_pool" "node_pool" {
  for_each = { for node_pool in var.node_pools : node_pool.name => node_pool }

  name       = each.value.name
  location   = each.value.location
  cluster    = google_container_cluster.cluster.name
  node_count = each.value.node_count

  node_config {
    machine_type = each.value.machine_type
  }
}