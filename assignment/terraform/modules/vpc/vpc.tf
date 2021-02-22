resource "aws_vpc" "vpc" {
  cidr_block           = var.aws_info.cidr_block
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "false"
  enable_classiclink   = "false"
  tags = {
    Env = var.env
    Name = var.aws_info.vpc_name
  }
}

resource "aws_subnet" "subnet" {
  vpc_id                  = aws_vpc.vpc.id
  availability_zone       = var.aws_info.availability_zone
  cidr_block              = var.aws_info.subnet
  map_public_ip_on_launch = "true"

  tags = {
    Env = var.env
    Name = var.aws_info.vpc_name
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Env = var.env
    Name = var.aws_info.gw_name
  }
}