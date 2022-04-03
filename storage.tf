resource "google_storage_bucket" "function_bucket" {
    name     = "${var.bucket_name}-${var.env}"
    location = var.region
}
