terraform {
  backend "s3" {
    bucket = "staging-group4"
    key    = "staging-webserver/terraform.tfstate"
    region = "us-east-1"
  }
}
