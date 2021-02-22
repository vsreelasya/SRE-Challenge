resource "aws_eip" "eip_elb" {
  vpc     = true
  tags    = {
    Name  = "${lookup(var.elb_info, "environment")}_eip_${lookup(var.elb_info, "name")}"
    Env   = lookup(var.elb_info, "environment")
  }
}

resource "aws_lb" "dev_docker" {
  name               = "dev_docker-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [module.sg.sg_id]
  subnet_mapping {
    subnet_id     = lookup(var.elb_info,"subnet")
    allocation_id = aws_eip.eip_elb.id
  }
  tags = {
    Environment = lookup(var.elb_info,"environment")
  }

  enable_deletion_protection = true

  access_logs {
    bucket  = aws_s3_bucket.lb_logs.bucket
    prefix  = "test-lb"
    enabled = true
  }

  tags = {
    Environment = "dev"
  }
}

resource "aws_lb_target_group" "target_group" {
  name        = "target-group"
  port        = 80
  protocol    = "HTTP"
  target_type = "ip"
  vpc_id      = aws_lb.load_balancer.vpc_id 
  health_check {
    matcher = "80"
    path = "/"
  }
}

resource "aws_lb_listener" "listener" {
  load_balancer_arn = "${aws_alb.application_load_balancer.arn}"
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.target_group.arn}"
  }
}
