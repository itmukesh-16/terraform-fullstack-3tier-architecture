#VPC Creation
resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = var.vpc_name
  }
}

#internet Gateway Creation and attachment to VPC
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "igw"
  }
}

# Elastic IP Creation for NAT Gateway
resource "aws_eip" "nat_eip" {
  domain = "vpc"
  tags = {
    Name = "nat-eip"
  }
}

# NAT Gateway Creation , eip association and attachment to public subnet 
resource "aws_nat_gateway" "nat_gw" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.public_subnet-1.id
  tags = {
    Name = "nat-gw"
  }
}

#public Subnet Creation
resource "aws_subnet" "public_subnet-1" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.public_subnet_cidr_1
  availability_zone       = var.availability_zone_1

  tags = {
    Name = "public-subnet-1"
  }
}
resource "aws_subnet" "public_subnet-2" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.public_subnet_cidr_2
  availability_zone       = var.availability_zone_2

  tags = {
    Name = "public-subnet-2"
  }
}

#private frontend Subnet Creation
resource "aws_subnet" "frontend_subnet-1" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.frontend_subnet_cidr_1
  availability_zone       = var.availability_zone_1

  tags = {
    Name = "frontend-subnet-1"
  }
}

resource "aws_subnet" "frontend_subnet-2" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.frontend_subnet_cidr_2
  availability_zone       = var.availability_zone_2

  tags = {
    Name = "frontend-subnet-2"
  }
}

#private backend Subnet Creation
resource "aws_subnet" "backend_subnet-1" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.backend_subnet_cidr_1
  availability_zone       = var.availability_zone_1

  tags = {
    Name = "backend-subnet-1"
  }
}

resource "aws_subnet" "backend_subnet-2" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.backend_subnet_cidr_2
  availability_zone       = var.availability_zone_2

  tags = {
    Name = "backend-subnet-2"
  }
}

#private database Subnet Creation
resource "aws_subnet" "database_subnet-1" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.database_subnet_cidr_1
  availability_zone       = var.availability_zone_1

  tags = {
    Name = "database-subnet-1"
  }
}

resource "aws_subnet" "database_subnet-2" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.database_subnet_cidr_2
  availability_zone       = var.availability_zone_2

  tags = {
    Name = "database-subnet-2"
  }
}

# Route Table Creation for Public Subnet and association with Internet Gateway
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "public-rt"
  }
}

#public subnet association
resource "aws_route_table_association" "public_rt_to_public_subnet-1_assoc_1" {
  subnet_id      = aws_subnet.public_subnet-1.id
  route_table_id = aws_route_table.public_rt.id
}
resource "aws_route_table_association" "public_rt_to_public_subnet-2_assoc_2" {
  subnet_id      = aws_subnet.public_subnet-2.id
  route_table_id = aws_route_table.public_rt.id
}


# Route Table Creation for Private Subnet and association with NAT Gateway
resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gw.id
  }
  tags = {
    Name = "private-rt"
  }
}

#private subnate association ============================================================

#frontend
resource "aws_route_table_association" "private_rt_to_frontend_subnet-1_assoc_1" {
  subnet_id = aws_subnet.frontend_subnet-1.id
  route_table_id = aws_route_table.private_rt.id
}
resource "aws_route_table_association" "private_rt_to_frontend_subnet-2_assoc_2" {
  subnet_id = aws_subnet.frontend_subnet-2.id
  route_table_id = aws_route_table.private_rt.id  
}

#backend
resource "aws_route_table_association" "private_rt_to_backend_subnet-1_assoc_1" {
  subnet_id = aws_subnet.backend_subnet-1.id
  route_table_id = aws_route_table.private_rt.id
}
resource "aws_route_table_association" "private_rt_to_backend_subnet-2_assoc_2" {
  subnet_id = aws_subnet.backend_subnet-2.id
  route_table_id = aws_route_table.private_rt.id
}

#database
resource "aws_route_table_association" "private_rt_to_database_subnet-1_assoc_1" {
  subnet_id = aws_subnet.database_subnet-1.id
  route_table_id = aws_route_table.private_rt.id
}
resource "aws_route_table_association" "private_rt_to_database_subnet-2_assoc_1" {
  subnet_id = aws_subnet.database_subnet-2.id
  route_table_id = aws_route_table.private_rt.id
}