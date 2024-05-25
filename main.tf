resource "google_compute_instance" "vm_instance" {
  name         = "terraform-instance"
  machine_type = "e2-micro"

  boot_disk {
    initialize_params {
      image = "ubuntu-2204-jammy-v20240519"
    }
  }

  network_interface {
    # A default network is created for all GCP projects
    network = "default"
    access_config {
    }
  }
}

# resource "google_compute_network" "vpc_network" {
#   name                    = "terraform-network"
#   auto_create_subnetworks = "true"
# }

resource "google_sql_database_instance" "main" {
  name                = "main-instance"
  database_version    = "POSTGRES_14"
  deletion_protection = false

  settings {
    # Second-generation instance tiers are based on the machine
    # type. See argument reference below.
    tier = "db-f1-micro"
  }
}
