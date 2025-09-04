# main.tf

# This block retrieves environment variables.
# The 'var' prefix is a convention for referring to variables.
# Terraform variables are defined in variables.tf
provider "google" {
  project = var.project
  zone    = var.region
}
resource "google_compute_instance" "vm" {
  name         = "vm-${var.project}"
  machine_type = "e2-micro"
  zone         = "${var.region}-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = "default"
  }
}
