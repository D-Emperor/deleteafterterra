# creating VPC
resource "aws_vpc" "TF_VPC-alias" {
  provider             = aws.hyd
  cidr_block           = var.cidr_block
  enable_dns_hostnames = true
  tags = {
    Name = var.vpc_name
  }
}

#creating subnets
resource "aws_subnet" "public-subnets-alias" {
  provider = aws.hyd
  count    = length(var.public_subnet_cidr)
  # Conditional statement, instead of above variable. based on our requirment we have to choose
  # count = var.env == "PROD" ? 3 : 5    
  vpc_id            = aws_vpc.TF_VPC-alias.id
  cidr_block        = element(var.public_subnet_cidr, count.index)
  availability_zone = element(lookup(var.azs, var.region), count.index)

  tags = {
    Name = "${var.vpc_name}-public-alias-${count.index + 1}"
  }
}