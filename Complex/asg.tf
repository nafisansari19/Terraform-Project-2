# Create an autoscaling group with the specified configurations
resource "aws_autoscaling_group" "asg" {
  name                = "my-asg"
  min_size            = 2
  max_size            = 5
  desired_capacity    = 2
  vpc_zone_identifier = [aws_subnet.private_subnet_1.id, aws_subnet.private_subnet_2.id]
  launch_template {
    id = aws_launch_template.lt-asg.id
  }

  # Tag the autoscaling group for easier identification
  tag {
    key                 = "Name"
    value               = "my Private ASG"
    propagate_at_launch = true
  }
}

# Create a launch template with the specified configurations
resource "aws_launch_template" "lt-asg" {
  name                   = "my-lt-asg"
  image_id               = var.ami_id
  instance_type          = var.instance
  key_name               = var.key
  vpc_security_group_ids = [aws_security_group.lt-sg.id]
  user_data              = filebase64("${path.root}/install_apache.sh")
}

#Attach the autoscaling group to the target group of the ALB
resource "aws_autoscaling_attachment" "asg-tg-attach" {
  autoscaling_group_name = aws_autoscaling_group.asg.id
  lb_target_group_arn    = aws_lb_target_group.alb-tg.arn
}
