resource "aws_vpc" "app1" {
  cidr_block           = "10.32.0.0/16"
  enable_dns_support   = true  # Enable DNS support
  enable_dns_hostnames = true  # Enable DNS hostnames

  tags = {
    Name    = "app1"
    Service = "application1"
    Owner   = "Chewbacca"
    Planet  = "Mustafar"
  }
}

resource "aws_vpc_endpoint" "s3" {
  vpc_id       = aws_vpc.app1.id
  service_name = "com.amazonaws.eu-west-1.s3"
  vpc_endpoint_type = "Gateway"

  route_table_ids = [
    aws_route_table.private.id,
    aws_route_table.public.id
  ]

  tags = {
    Name    = "app1_s3_endpoint"
    Service = "application1"
    Owner   = "Chewbacca"
    Planet  = "Mustafar"
  }
}


