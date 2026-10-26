output "vpc_name" {
  value = module.dev-vpc.vpc_name
}

output "vpc_id" {
  value = module.dev-vpc.vpc_id
}

output "sg_id" {
  value = module.dev_sg.sg_id
}

output "public_subnets" {
  value = module.dev-vpc.public_subnets
}

output "private_subnets" {
  value = module.dev-vpc.private_subnets
}