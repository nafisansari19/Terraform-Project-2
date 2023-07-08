# Create a new load balancer
resource "aws_lb" "my-alb" {
  name            = "my-loadbalancer"
  subnets         = ["subnet-6f9f0209", "subnet-6a1a824b"]
  security_groups = [aws_security_group.alb-sg.id]

  tags = {
    Name = "my-public-ALB"
  }
}

# Create a target group for the load balancer
resource "aws_lb_target_group" "alb-tg" {
  name     = "alb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc-id

  # Set the health check configuration for the target group
  health_check {
    interval = 60
    path     = "/"
    port     = 80
    timeout  = 45
    protocol = "HTTP"
    matcher  = "200,202"
  }
}


# Create ALB listener
resource "aws_lb_listener" "alb-listener" {
  load_balancer_arn = aws_lb.my-alb.arn
  port              = "80"
  protocol          = "HTTP"

  # Set the default action for the listener
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb-tg.arn
  }
}
