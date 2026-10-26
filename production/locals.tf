locals {
  common_tags = {
    Name        = var.vpc_name
    Owner       = "Prod-team"
    teamdl      = "emailid"
    environment = var.environment
  }
}
