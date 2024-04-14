terraform {
  backend "s3" {
    bucket = "prod-group4"
    key    = "prod-webserver/terraform.tfstate"
    region = "us-east-1"
  }
}
