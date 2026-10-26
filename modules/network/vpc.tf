  resource "aws_vpc" "default" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true

  tags = merge(var.common_tags, {
    Name = "${var.environment}-${var.vpc_name}"
  })
}

resource "aws_internet_gateway" "default" {
  vpc_id = aws_vpc.default.id
  tags = {
    Name = "${var.IGW_name}-${var.environment}"
  }
}