resource "aws_security_group" "app1_sg02_LB01" {
  name        = "app1_sg02_LB01"
  description = "app1_sg02_LB01"
  vpc_id      = aws_vpc.app1.id

  ingress {
    description = "LBExternal"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow inbound HTTPS traffic"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name    = "app1_sg02_LB01"
    Service = "application1"
    Owner   = "Chewbacca"
    Planet  = "Mustafar"
  }
}
