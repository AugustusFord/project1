resource "aws_launch_template" "app1_LT" {
  name_prefix   = "app1_LT"
  image_id      = "ami-06ed60ed1369448bd"
  instance_type = "t2.micro"

  key_name = "MyLinuxBox"

  vpc_security_group_ids = [aws_security_group.app1_sg01_servers.id]

  user_data = filebase64("${path.module}/user-data.sh")


  tag_specifications {
    resource_type = "instance"
    tags = {
      Name    = "app1_LT"
      Service = "application1"
      Owner   = "Chewbacca"
      Planet  = "Mustafar"
    }
  }

  lifecycle {
    create_before_destroy = true
  }
}