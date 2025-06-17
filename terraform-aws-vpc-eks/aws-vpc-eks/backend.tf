terraform {
  backend "s3" {
    bucket       = var.backend_s3_bucket_name
    key          = var.backend_object_key
    region       = var.region
    use_lockfile = true
  }
}
