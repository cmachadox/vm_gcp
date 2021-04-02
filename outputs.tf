output "ip_external_tux" {
  description = "Name of instance template"
  value       = google_compute_address.elastic_ip_tux.name
}

output "vm_tux" {
  description = "Tags that will be associated with instance(s)"
  value       = google_compute_instance.vm_tux.name
}

output "allow_trafic" {
  description = "Tags that will be associated with instance(s)"
  value       = google_compute_firewall.allow_trafic.name
}
