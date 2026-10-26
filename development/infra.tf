module "dev-vpc" {
  source             = "../modules/network"
  vpc_cidr           = var.vpc_cidr
  vpc_name           = var.vpc_name
  environment        = var.environment
  IGW_name           = var.IGW_name
  public_cidr_block  = var.public_cidr_block
  private_cidr_block = var.private_cidr_block
  azs                = var.azs
  common_tags        = local.common_tags
}

module "dev_sg" {
  source        = "../modules/sg"
  vpc_id        = module.dev-vpc.vpc_id
  vpc_name      = var.vpc_name
  environment   = var.environment
  ingress_value = var.ingress_value
  common_tags   = local.common_tags
}

module "compute-instance" {

  source         = "../modules/compute"
  public_subnet  = module.dev-vpc.public_subnets
  sg_id          = module.dev_sg.sg_id
  common_tags    = local.common_tags
  aws_region     = var.aws_region
  private_subnet = module.dev-vpc.private_subnets
  key_name       = var.key_name
  azs            = var.azs
  environment    = var.environment
  amis           = var.amis

}