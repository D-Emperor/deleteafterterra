# Elastic IP creation
resource "aws_eip" "my_eip" {
  tags = {
    Name = "Nat-EIP"
  }
}

# Nat gate way creation
resource "aws_nat_gateway" "my_nat_gw" {
  allocation_id = aws_eip.my_eip.id
  subnet_id     = aws_subnet.public-subnets.0.id

  tags = {
    Name = "NAT-Gateway"
  }
  # To ensure proper ordering, it is recommended to add an explicit dependency
  depends_on = [aws_internet_gateway.tf_igw]
}