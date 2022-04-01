output "cluster_id" {
  value = google_container_cluster.cluster.id
}
output "cluster_endpoint" {
  value = google_container_cluster.cluster.endpoint
}

output "cluster_client_certificate" {
  value = google_container_cluster.cluster.master_auth.0.client_certificate
}