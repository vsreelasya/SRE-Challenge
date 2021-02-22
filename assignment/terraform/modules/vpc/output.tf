output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "subnet_id" {
  value = aws_subnet.subnet.id
}

output "gw_id" {
  value = aws_internet_gateway.gw.id
}
