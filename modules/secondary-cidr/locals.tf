data "aws_availability_zones" "available" {}
locals {
  azs                 = slice(data.aws_availability_zones.available.names, 0, 3)
  num_public_subnets  = length(var.public_subnet_cidrs)
  num_private_subnets = length(var.private_subnet_cidrs)
  public_subnet_names = {
    for idx in range(length(var.public_subnet_cidrs)) :
    idx => "${var.name}-public-subnet-${idx + 1}"
  }
  private_subnet_names = {
    for idx in range(length(var.private_subnet_cidrs)) :
    idx => "${var.name}-private-subnet-${idx + 1}"
  }
}
