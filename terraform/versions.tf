terraform {
  required_version = ">= 1.3"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 4.74"
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = ">= 4.74"
    }
  }
  provider_meta "google" {
    module_name = "blueprints/terraform/fs-exported/v0.1.0"
  }
  provider_meta "google-beta" {
    module_name = "blueprints/terraform/fs-exported/v0.1.0"
  }
}
