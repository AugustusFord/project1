resource "aws_eip" "nat" {
  vpc = true

  tags = {
    Name = "nat"
  }
}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public_eu_west_1a.id
  depends_on    = [aws_internet_gateway.app1_igw]

  tags = {
    Name    = "app1_nat"
    Service = "application1"
    Owner   = "Chewbacca"
    Planet  = "Mustafar"
  }
}