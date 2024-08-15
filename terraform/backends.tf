terraform {
  backend "gcs" {
    bucket = "sebringautomotive-shop-config"
    prefix = "terraform"
  }
}
