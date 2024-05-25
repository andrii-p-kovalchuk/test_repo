terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.30.0"
    }
  }
}

provider "google" {
  project = "amplified-grail-423921-n7"
  region  = "europe-north1"
  zone    = "europe-north1-c"
}

