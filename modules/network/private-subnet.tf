resource "aws_subnet" "private-subnet" {
  #   count             = 3
  count             = length(var.private_cidr_block)
  vpc_id            = aws_vpc.default.id
  cidr_block        = element(var.private_cidr_block, count.index)
  availability_zone = element(var.azs, count.index)

  tags = merge(var.common_tags, {
    Name = "${var.environment}-${var.vpc_name}-private-${count.index + 1}"
  })
}
