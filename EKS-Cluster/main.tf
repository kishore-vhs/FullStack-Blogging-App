provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "blogging_vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "Blogging VPC"
  }
}

resource "aws_subnet" "blogging_subnet" {
  count = 2
  vpc_id = aws_vpc.blogging_vpc.id
  cidr_block = cidrsubnet(aws_vpc.blogging_vpc.cidr_block, 8, count.index)
  availability_zone = element(["us-east-1a", "us-east-1b"], count.index)
  map_public_ip_on_launch = true
  tags = {
    Name = "Blogging-Subnet-${count.index}"
  }
}

resource "aws_internet_gateway" "blogging-igw" {
    vpc_id = aws_subnet.blogging_vpc.id

    tags = {
        Name = "Blogging-IGW"
    }
}

resource "aws_route_table" "blogging-rt" {
    vpc_id = aws_vpc.blogging_vpc.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.blogging-igw.id
    }
    tags = {
        Name = "blogging-route-table"
    }
}