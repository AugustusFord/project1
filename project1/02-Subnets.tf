# Public Subnets
resource "aws_subnet" "public_eu_west_1a" {
  vpc_id                  = aws_vpc.app1.id
  cidr_block              = "10.32.1.0/24"
  availability_zone       = "eu-west-1a"
  map_public_ip_on_launch = true

  tags = {
    Name    = "public-eu-west-1a"
    Service = "application1"
    Owner   = "Chewbacca"
    Planet  = "Mustafar"
  }
}

resource "aws_subnet" "public_eu_west_1b" {
  vpc_id                  = aws_vpc.app1.id
  cidr_block              = "10.32.2.0/24"
  availability_zone       = "eu-west-1b"
  map_public_ip_on_launch = true

  tags = {
    Name    = "public-eu-west-1b"
    Service = "application1"
    Owner   = "Chewbacca"
    Planet  = "Mustafar"
  }
}

resource "aws_subnet" "public_eu_west_1c" {
  vpc_id                  = aws_vpc.app1.id
  cidr_block              = "10.32.3.0/24"
  availability_zone       = "eu-west-1c"
  map_public_ip_on_launch = true

  tags = {
    Name    = "public-eu-west-1c"
    Service = "application1"
    Owner   = "Chewbacca"
    Planet  = "Mustafar"
  }
}

# Private Subnets
resource "aws_subnet" "private_eu_west_1a" {
  vpc_id            = aws_vpc.app1.id
  cidr_block        = "10.32.11.0/24"
  availability_zone = "eu-west-1a"

  tags = {
    Name    = "private-eu-west-1a"
    Service = "application1"
    Owner   = "Chewbacca"
    Planet  = "Mustafar"
  }
}

resource "aws_subnet" "private_eu_west_1b" {
  vpc_id            = aws_vpc.app1.id
  cidr_block        = "10.32.12.0/24"
  availability_zone = "eu-west-1b"

  tags = {
    Name    = "private-eu-west-1b"
    Service = "application1"
    Owner   = "Chewbacca"
    Planet  = "Mustafar"
  }
}

resource "aws_subnet" "private_eu_west_1c" {
  vpc_id            = aws_vpc.app1.id
  cidr_block        = "10.32.13.0/24"
  availability_zone = "eu-west-1c"

  tags = {
    Name    = "private-eu-west-1c"
    Service = "application1"
    Owner   = "Chewbacca"
    Planet  = "Mustafar"
  }
}

