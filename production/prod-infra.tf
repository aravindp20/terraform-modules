module "prod-vpc" {
  source             = "../modules/network"
  vpc_cidr           = var.vpc_cidr
  vpc_name           = var.vpc_name
  environment        = var.environment
  IGW_name           = var.IGW_name
  public_cidr_block  = var.public_cidr_block
  private_cidr_block = var.private_cidr_block
  azs                = var.azs
  common_tags   = local.common_tags
}
