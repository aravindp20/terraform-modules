provider "aws" {
  region = var.aws_region
}

terraform {
  backend "s3" {
    bucket = "allworkspace-statefile"
    key    = "development.tfstate"
    region = "ap-south-2"
  }
}