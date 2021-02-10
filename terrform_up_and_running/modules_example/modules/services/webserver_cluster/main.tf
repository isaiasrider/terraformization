resource "aws_launch_configuration" "asg_web_launch_configuration" {
  image_id = "ami-0a0ad6b70e61be944"
  instance_type = "t2.micro"
  security_groups = [aws_security_group.asg_security_group.id]
  name = "${var.cluster_name}-lc"
  user_data = data.template_file.script.rendered
  key_name = "terraform"


  lifecycle {
    create_before_destroy = true
  }

}


resource "aws_autoscaling_group" "asg_web" {
  launch_configuration = aws_launch_configuration.asg_web_launch_configuration.name
  max_size = 2
  min_size = 1
  vpc_zone_identifier = data.aws_subnet_ids.default.ids
  name_prefix = "${var.cluster_name}-instance"

  target_group_arns = [aws_lb_target_group.target_group_asg.arn]
  health_check_type = "ELB"

  tag {
    key = "Name"
    propagate_at_launch = true
    value = "${var.cluster_name}-asg"

  }
}

resource "aws_lb" "lb_web" {
  name = "${var.cluster_name}-terraform-lb-asg"
  load_balancer_type = "application"
  subnets = data.aws_subnet_ids.default.ids
  security_groups = [aws_security_group.asg_security_group.id]
}

resource "aws_lb_listener" "http_listener" {
  load_balancer_arn = aws_lb.lb_web.arn
  port = var.server_port
  protocol = "HTTP"
  default_action {
    type = "fixed-response"
    fixed_response {
      content_type = "text/plain"
      message_body = "404: ow doido, nem existe essa page"
      status_code = 404
    }
  }
}

resource "aws_lb_target_group" "target_group_asg" {
  name = "${var.cluster_name}-terraform-example"
  port = var.server_port
  protocol = "HTTP"
  vpc_id = data.aws_vpc.default.id
  health_check {
    path = "/"
    protocol = "HTTP"
    matcher = "200"
    interval = 15
    timeout = 3
    healthy_threshold = 2
    unhealthy_threshold = 2
  }
}

resource "aws_lb_listener_rule" "listener_rule" {
  listener_arn = aws_lb_listener.http_listener.arn
  priority = 100
  action {
    type = "forward"
    target_group_arn = aws_lb_target_group.target_group_asg.arn
  }
  condition {
    path_pattern {
      values = ["*"]
    }
  }
}

data template_file script {
  template = "${file("${path.module}/script/user-data.sh")}"
}