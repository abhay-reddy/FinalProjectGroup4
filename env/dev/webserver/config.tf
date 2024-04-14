terraform {
  backend "s3" {
    bucket = "dev-group4" // bucket in which tf state is saved
    key    = "dev-webserver/terraform.tfstate"
    region = "us-east-1"
  }
}
