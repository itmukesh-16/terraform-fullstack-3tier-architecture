#public security=======================================================
resource "aws_security_group" "public-sg" {
  name        = "public-sg"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.vpc.id

  tags = {
    Name = "public-sg"
  }
}
resource "aws_vpc_security_group_ingress_rule" "public-sg-inbound" {
  security_group_id = aws_security_group.public-sg.id
  cidr_ipv4         = aws_vpc.vpc.cidr_block
#   from_port         = 443
#   ip_protocol       = "tcp"
#   to_port           = 443
    ip_protocol = "-1" # allow all ports
}

resource "aws_vpc_security_group_egress_rule" "public-sg-outbound" {
  security_group_id = aws_security_group.public-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}

#frontend security group 
resource "aws_security_group" "frontend-sg" {
  name        = "frontend-sg"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.vpc.id

  tags = {
    Name = "frontend-sg"
  }
}
resource "aws_vpc_security_group_ingress_rule" "frontend-sg-inbound" {
  security_group_id = aws_security_group.frontend-sg.id
  cidr_ipv4         = aws_vpc.vpc.cidr_block
#   from_port         = 443
#   ip_protocol       = "tcp"
#   to_port           = 443
    ip_protocol = "-1" # allow all ports
}

resource "aws_vpc_security_group_egress_rule" "frontend-sg-outbound" {
  security_group_id = aws_security_group.frontend-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}


#backend security group =========================================================================
resource "aws_security_group" "backend-sg" {
  name        = "backend-sg"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.vpc.id

  tags = {
    Name = "backend-sg"
  }
}
resource "aws_vpc_security_group_ingress_rule" "backend-sg-inbound" {
  security_group_id = aws_security_group.backend-sg.id
  cidr_ipv4         = aws_vpc.vpc.cidr_block
#   from_port         = 443
#   ip_protocol       = "tcp"
#   to_port           = 443
    ip_protocol = "-1" # allow all ports
}

resource "aws_vpc_security_group_egress_rule" "backend-sg-outbound" {
  security_group_id = aws_security_group.backend-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}

#database security group ================================================================
resource "aws_security_group" "database-sg" {
  name        = "database-sg"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.vpc.id

  tags = {
    Name = "database-sg"
  }
}
resource "aws_vpc_security_group_ingress_rule" "database-sg-inbound" {
  security_group_id = aws_security_group.database-sg.id
  cidr_ipv4         = aws_vpc.vpc.cidr_block
#   from_port         = 443
#   ip_protocol       = "tcp"
#   to_port           = 443
    ip_protocol = "-1" # allow all ports
}

resource "aws_vpc_security_group_egress_rule" "database-sg-outbound" {
  security_group_id = aws_security_group.database-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}