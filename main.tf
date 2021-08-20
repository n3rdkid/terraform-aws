
resource "aws_vpc" "custom_vpc" {
    cidr_block = var.vpc_cidr_blocks
    tags ={
        Name: "${var.env_prefix}-vpc"
    }
}

resource "aws_subnet" "custom_subnet_1" {
    vpc_id = aws_vpc.custom_vpc.id
    cidr_block = var.subnet_cidr_blocks
    availability_zone = var.availability_zone
    tags ={
        Name: "${var.env_prefix}-subnet_1"
    }
}


