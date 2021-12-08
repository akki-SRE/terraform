# provider "aws" {
#   region = "us-east-1"
# }


# Creating Vpc
resource "aws_vpc" "main_vpc" {
  for_each = var.vpc
  cidr_block = each.value["cidr_block"]
  tags = {
    name = "custom_vpc"
    environment = "testing"
  }
}

# Creating Private Subnet
resource "aws_subnet" "private_subnet" {
  for_each = var.subnet
  vpc_id                  = aws_vpc.main_vpc["vpc_main"].id
  cidr_block              = each.value["cidr_block"]
  availability_zone       = each.value["availability_zone"]
  map_public_ip_on_launch = each.value["map_public_ip_on_launch"]
}

# Creating Route Table
resource "aws_route_table" "route_table" {
  vpc_id = aws_vpc.main_vpc["vpc_main"].id
  route = []
 }

# Creating Route Table Association of Private subnet1
resource "aws_route_table_association" "internet_for_pub_sub1" {
  route_table_id = aws_route_table.route_table.id
  subnet_id      = aws_subnet.private_subnet["subnet1"].id
}

# Creating Route Table Association of Private subnet2
resource "aws_route_table_association" "internet_for_pub_sub2" {
  route_table_id = aws_route_table.route_table.id
  subnet_id      = aws_subnet.private_subnet["subnet2"].id
}
