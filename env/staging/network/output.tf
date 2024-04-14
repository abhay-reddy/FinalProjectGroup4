# for adding the output variables
output "public_subnet_id" {
  value = module.vpc-staging.public_subnet_id
}

output "private_subnet_id" {
  value = module.vpc-staging.private_subnet_id
}

output "vpc_id" {
  value = module.vpc-staging.vpc_id
}