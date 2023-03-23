# Public subnet association with public route table
resource "aws_route_table_association" "public_subnet_associate" {
  count = length(var.public_subnet_cidr)
  # here we are using the * because it will become 0,1,2 after every iteration
  subnet_id      = element(aws_subnet.public-subnets.*.id, count.index)
  route_table_id = aws_route_table.terra-public-rt.id
}

# Private subnet association with private route table

resource "aws_route_table_association" "private_subnet_associate" {
  count          = length(var.private_subnet_cidr)
  subnet_id      = element(aws_subnet.private-subnets.*.id, count.index)
  route_table_id = aws_route_table.terra-private-rt.id
}