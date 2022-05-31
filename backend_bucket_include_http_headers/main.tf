resource "google_compute_backend_bucket" "image_backend" {
  name        = "image-backend-bucket-${local.name_suffix}"
  description = "Contains beautiful images"
  bucket_name = google_storage_bucket.image_bucket.name
  enable_cdn  = true
  cdn_policy {
    cache_key_policy {
        include_http_headers = ["X-My-Header-Field"]
    }
  }
}

resource "google_storage_bucket" "image_bucket" {
  name     = "image-backend-bucket-${local.name_suffix}"
  location = "EU"
}
