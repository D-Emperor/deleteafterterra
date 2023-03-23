# Public Route table
resource "aws_route_table" "terra-public-rt" {
  vpc_id = aws_vpc.TF_VPC.id
  route {
    cidr_block = "0.0.0.0/16"
    gateway_id = aws_internet_gateway.tf_igw.id
  }
  tags = {
    Name = "${var.vpc_name}- Public-RT"
  }
}

# Private Route table contains Nat_Gateway
resource "aws_route_table" "terra-private-rt" {
  vpc_id = aws_vpc.TF_VPC.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.my_nat_gw.id
  }

  tags = {
    Name = "${var.vpc_name}- Private-RT"
  }
}