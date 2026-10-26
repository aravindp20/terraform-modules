resource "aws_subnet" "public-subnet" {
  #   count             = 3
  count             = length(var.public_cidr_block)
  vpc_id            = aws_vpc.default.id
  cidr_block        = element(var.public_cidr_block, count.index)
  availability_zone = element(var.azs, count.index)

  tags = merge(var.common_tags, {
    Name = "${var.environment}-${var.vpc_name}-public-${count.index + 1}"
  })
}