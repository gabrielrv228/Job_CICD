provider "google" {
  credentials = "${file("resolute-vault-339210-0935f51f162f.json")}"
  project = var.project_id
  region  = var.region
}
