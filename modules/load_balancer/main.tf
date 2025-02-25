resource "aws_lb" "myAlb" {
  name               = "myAlb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.security_group_id]
  subnets            = [var.subnet1_id, var.subnet2_id]

  tags = {
    Name = "web"
  }
}

resource "aws_lb_target_group" "tg" {
  name     = "myTG"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    path = "/"
    port = "traffic-port"
  }
}

resource "aws_lb_target_group_attachment" "attach1" {
  target_group_arn = aws_lb_target_group.tg.arn
  target_id        = var.ec2_instance_ids[0]
  port             = 80
}

resource "aws_lb_target_group_attachment" "attach2" {
  target_group_arn = aws_lb_target_group.tg.arn
  target_id        = var.ec2_instance_ids[1]
  port             = 80
}

resource "aws_lb_listener" "listener" {
  load_balancer_arn = aws_lb.myAlb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_lb_target_group.tg.arn
    type             = "forward"
  }
}


