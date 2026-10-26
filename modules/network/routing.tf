resource "aws_route_table" "public-route-table" {
  vpc_id = aws_vpc.default.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.default.id
  }

  tags = merge(var.common_tags, {
    Name = "${var.environment}-${var.vpc_name}-public-rt-"
  })
}

resource "aws_route_table" "private-route-table" {
  vpc_id = aws_vpc.default.id

  tags = merge(var.common_tags, {
    Name = "${var.environment}-${var.vpc_name}-private-rt"
  })
}

resource "aws_route_table_association" "public-rta" {
  #   count          = 3
  count          = length(var.public_cidr_block)
  subnet_id      = element(aws_subnet.public-subnet.*.id, count.index)
  route_table_id = aws_route_table.public-route-table.id
}

resource "aws_route_table_association" "private-rta" {
  #   count          = 3
  count          = length(var.private_cidr_block)
  subnet_id      = element(aws_subnet.private-subnet.*.id, count.index)
  route_table_id = aws_route_table.private-route-table.id
}