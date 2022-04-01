output "cluster_id" {
  value = google_container_cluster.cluster.id
}
output "cluster_endpoint" {
  value = google_container_cluster.cluster.endpoint
}

output "cluster_certificate" {
  value = base64decode(google_container_cluster.cluster.master_auth.0.cluster_ca_certificate)
}

output "cluster_client_certificate" {
  value = base64decode(google_container_cluster.cluster.master_auth.0.client_certificate)
}