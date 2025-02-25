resource "aws_vpc" "myvpc" {
  cidr_block = var.cidr
}

resource "aws_subnet" "subnet1" {
  vpc_id = aws_vpc.myvpc.id
  cidr_block = var.subnet1_cidr
  availability_zone = var.availability_zones[0]
  map_public_ip_on_launch = true
}

resource "aws_subnet" "subnet2" {
  vpc_id = aws_vpc.myvpc.id
  cidr_block = var.subnet2_cidr
  availability_zone = var.availability_zones[1]
  map_public_ip_on_launch = true
}

resource "aws_internet_gateway" "myigw" {
  vpc_id = aws_vpc.myvpc.id
}

resource "aws_route_table" "myRT" {
  vpc_id = aws_vpc.myvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.myigw.id
  }
}

resource "aws_route_table_association" "myrta1" {
  subnet_id = aws_subnet.subnet1.id
  route_table_id = aws_route_table.myRT.id
}

resource "aws_route_table_association" "myrta2" {
  subnet_id = aws_subnet.subnet2.id
  route_table_id = aws_route_table.myRT.id
}


