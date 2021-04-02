provider "google" {
  project               = var.project_id
  region                = var.region
}

terraform {
  required_version      = "~> 0.12.0"
}

#---------------------------------------------------
## IP Externo Bastion
resource "google_compute_address" "elastic_ip_tux" {
  name                  = var.elastic_ip_tux.name
  address_type          = var.elastic_ip_tux.address_type
  network_tier          = var.elastic_ip_tux.network_tier
  region                = var.region

}
#---------------------------------------------------
resource "google_compute_firewall" "allow_trafic" {
  name                  = var.allow_trafic.name
  network               = var.allow_trafic.network
  allow {
    ports               = ["80", "443", "22"]
    protocol            = "tcp"
  }
  allow {
    protocol            = "icmp"
  }
  target_tags           = [var.allow_trafic.target_tags]
  priority              = 1000
}
#---------------------------------------------------
#### VM
resource "google_compute_instance" "vm_tux" {
  name                  = var.vm_tux.name
  deletion_protection   = "false"
  machine_type          = var.vm_tux.machine_type
  zone                  = var.vm_tux.zone
  tags                  = [var.vm_tux.tags]
  metadata_startup_script = file("./install.sh")
  boot_disk {
    initialize_params {
      image             = var.vm_tux.image
      size              = var.vm_tux.size
      type              = var.vm_tux.type
    }
  }
  
network_interface {
    network             = var.vm_tux.network
    network_ip          = ""
    subnetwork          = var.vm_tux.subnetwork
    subnetwork_project  = ""
    access_config {
    nat_ip              = google_compute_address.elastic_ip_tux.address
    network_tier        = var.vm_tux.network_tier
   }
  }
}
