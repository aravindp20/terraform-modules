variable "vpc_cidr" {}
variable "vpc_name" {}
variable "environment" {}
variable "IGW_name" {}
variable "public_cidr_block" {}
variable "private_cidr_block" {}
variable "azs" {}
variable "common_tags" {
  type = map(string)
}