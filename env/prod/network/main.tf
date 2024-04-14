
# Module to deploy prod networking 
module "vpc-prod" {
  source               = "../../../modules/aws_network"
  env                  = var.env
  vpc_cidr             = var.vpc_cidr
  public_cidr_blocks   = var.public_subnet_cidrs
  private_cidr_blocks  = var.private_subnet_cidrs
  prefix               = var.prefix
  default_tags         = var.default_tags
}
