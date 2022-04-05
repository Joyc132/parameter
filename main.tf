provider "google" {
  project = "satya-project-344408"
  region  = "us-central1"
  credentials = "satya.json"
  zone    = "us-central1-a"
}

resource "google_compute_instance" "vm_instance" {
  name         = "terraform-instance1"
  machine_type = "f1-micro"

  boot_disk {
    initialize_params {
      image = "ubuntu-2004-focal-v20220331"
    }
  }

  network_interface {
    # A default network is created for all GCP projects
    network = "default"
    access_config {
    }
  }
}
