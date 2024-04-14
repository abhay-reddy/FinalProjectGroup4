terraform {
  backend "s3" {
    bucket = "prod-group4"
    key    = "prod-network/terraform.tfstate"
    region = "us-east-1"
  }
}
