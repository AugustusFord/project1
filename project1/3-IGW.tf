resource "aws_internet_gateway" "app1_igw" {
  vpc_id = aws_vpc.app1.id

   tags = {
    Name    = "app1_igw"
    Service = "application1"
    Owner   = "Chewbacca"
    Planet  = "Mustafar"
  }
} 