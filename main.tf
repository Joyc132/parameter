// Configure the Google Cloud provider
provider "google" {
 credentials = "${file("${var.credentials}")}"
 project     = "${var.gcp_project}"
 region      = "${var.region}"
 zone    = "${var.zone}"
}
// Create VPC
resource "google_compute_network" "vpc" {
 name                    = "${var.name}-vpc"
 auto_create_subnetworks = "false"
}

// Create Subnet
resource "google_compute_subnetwork" "subnet" {
 name          = "${var.name}-subnet"
 ip_cidr_range = "${var.subnet_cidr}"
 network       = "${var.name}-vpc"
 region      = "${var.region}"
}
// VPC firewall configuration
resource "google_compute_firewall" "firewall" {
  name    = "${var.name}-firewall"
  network = "${google_compute_network.vpc.name}"

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
}
resource "google_compute_instance" "vm_instance" {
  name         = "${var.instance_name}-instance"
  machine_type = "${var.machine_type}"

  boot_disk {
    initialize_params {
      image = "${var.image}"
    }
  }

  network_interface {
    # A default network is created for all GCP projects
    network = "${var.name}-vpc"
    access_config {
    }
  }
}
