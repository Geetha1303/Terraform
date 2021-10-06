terraform {
  #backend "remote" {
   # organization = "geetha-1303"

   # workspaces {
    #  name = "sample"
  #  }
  #}
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = "us-east-1"
}


resource "aws_vpc" "vpc" {
  cidr_block       = "${var.vpc-cidr}"
  instance_tenancy = "default"
  enable_dns_hostnames = true

  tags = {
    Name = "Test vpc"
  }
}


resource "aws_subnet" "public-subnet-1" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "${var.public-subnet-1-cidr}"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "public subnet 1"
  }
}

resource "aws_subnet" "public-subnet-2" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "${var.public-subnet-2-cidr}"
  availability_zone = "us-east-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "public subnet 2"
  }
}

resource "aws_subnet" "public-subnet-3" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "${var.public-subnet-3-cidr}"
  availability_zone = "us-east-1c"
  map_public_ip_on_launch = true

  tags = {
    Name = "public subnet 2"
  }
}


resource "aws_internet_gateway" "internet-gateway" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "Test IGW"
  }
}


resource "aws_route_table" "public-route-table" {
  vpc_id = aws_vpc.vpc.id

  route {
      cidr_block = "0.0.0.0/0"
      //CRT uses this IGW to reach internet
      gateway_id = aws_internet_gateway.internet-gateway.id
    }

  tags = {
    Name = "Public Route Table"
  }
}

resource "aws_route_table_association" "public-subnet-1-route-table-association" {
  subnet_id      = aws_subnet.public-subnet-1.id
  route_table_id = aws_route_table.public-route-table.id
}

resource "aws_route_table_association" "public-subnet-2-route-table-association" {
  subnet_id      = aws_subnet.public-subnet-2.id
  route_table_id = aws_route_table.public-route-table.id
}

resource "aws_route_table_association" "public-subnet-3-route-table-association" {
  subnet_id      = aws_subnet.public-subnet-3.id
  route_table_id = aws_route_table.public-route-table.id
}
resource "aws_nat_gateway" "Nat-gateway" {
  connectivity_type = "private"
  subnet_id         = aws_subnet.public-subnet-1.id
  tags      = {
    Name    = "Nat gateway"
  }
}


resource "aws_subnet" "private-subnet-1" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "${var.private-subnet-1-cidr}"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = false

  tags = {
    Name = "private subnet 1"
  }
}

resource "aws_subnet" "private-subnet-2" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "${var.private-subnet-2-cidr}"
  availability_zone = "us-east-1b"
  map_public_ip_on_launch = false

  tags = {
    Name = "private subnet 2"
  }
}

resource "aws_subnet" "private-subnet-3" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "${var.private-subnet-3-cidr}"
  availability_zone = "us-east-1c"
  map_public_ip_on_launch = false

  tags = {
    Name = "private subnet 3"
  }
}
resource "aws_route_table" "private-route-table" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "10.0.4.0/24"
    //CRT uses this IGW to reach internet
    gateway_id = aws_nat_gateway.Nat-gateway.id
  }

  tags = {
    Name = "Private Route Table"
  }
}

resource "aws_route_table_association" "private-subnet-1-route-table-association" {
  subnet_id      = aws_subnet.private-subnet-1.id
  route_table_id = aws_route_table.private-route-table.id
}

resource "aws_route_table_association" "private-subnet-2-route-table-association" {
  subnet_id      = aws_subnet.private-subnet-2.id
  route_table_id = aws_route_table.private-route-table.id
}

resource "aws_route_table_association" "private-subnet-3-route-table-association" {
  subnet_id      = aws_subnet.private-subnet-3.id
  route_table_id = aws_route_table.private-route-table.id
}



