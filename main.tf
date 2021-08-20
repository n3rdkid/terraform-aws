
resource "aws_vpc" "custom_vpc" {
  cidr_block = var.vpc_cidr_blocks
  tags = {
    Name : "${var.env_prefix}-vpc"
  }
}

resource "aws_subnet" "custom_subnet_1" {
  vpc_id            = aws_vpc.custom_vpc.id
  cidr_block        = var.subnet_cidr_blocks
  availability_zone = var.availability_zone
  tags = {
    Name : "${var.env_prefix}-subnet_1"
  }
}
resource "aws_internet_gateway" "custom-internet-gateway" {
  vpc_id = aws_vpc.custom_vpc.id
  tags = {
    Name = "${var.env_prefix}-igw"
  }
}
# resource "aws_route_table" "custom-route-table" {
#     vpc_id = aws_vpc.custom_vpc.id
#     route {
#         cidr_block = "0.0.0.0/0"
#         gateway_id = aws_internet_gateway.custom-internet-gateway.id
#     }
#     tags = {
#       Name = "${var.env_prefix}-rtb"
#     }

# }

# resource "aws_route_table_association" "a-rtb-subnet" {
#     subnet_id = aws_subnet.custom_subnet_1.id
#     route_table_id = aws_route_table.custom-route-table.id

# }
resource "aws_default_route_table" "main-rtb" {
  default_route_table_id = aws_vpc.custom_vpc.default_route_table_id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.custom-internet-gateway.id
  }
  tags = {
    Name = "${var.env_prefix}-rtb"
  }
}