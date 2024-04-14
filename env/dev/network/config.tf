terraform {
  backend "s3" {
    bucket = "dev-group4"
    key    = "dev-network/terraform.tfstate"
    region = "us-east-1"
  }
}
