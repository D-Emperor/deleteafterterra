## Public subnets

resource "aws_subnet" "public-subnets" {
  count             = length(var.public_subnet_cidr)
  vpc_id            = aws_vpc.TF_VPC.id
  cidr_block        = element(var.public_subnet_cidr, count.index)
  availability_zone = element(lookup(var.azs, var.aws_region), count.index)

  tags = {
    Name = "${var.vpc_name}-public-${count.index + 1}"
  }
}

## Private subnets

resource "aws_subnet" "private-subnets" {
  count             = length(var.private_subnet_cidr)
  vpc_id            = aws_vpc.TF_VPC.id
  cidr_block        = element(var.private_subnet_cidr, count.index)
  availability_zone = element(lookup(var.azs, var.aws_region), count.index)

  tags = {
    Name = "${var.vpc_name}-private-${count.index + 1}"
  }
}
