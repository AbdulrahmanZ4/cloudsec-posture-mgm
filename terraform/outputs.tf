output "web_instance_name" {
  value = google_compute_instance.web.name
}

output "db_instance_name" {
  value = google_compute_instance.db.name
}