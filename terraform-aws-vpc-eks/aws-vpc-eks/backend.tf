terraform {
  backend "s3" {
    bucket       = ""
    key          = "dev/project/terraform.tfstate"
    region       = "ap-south-1"
    use_lockfile = true
  }
}
