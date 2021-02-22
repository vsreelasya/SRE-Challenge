resource "aws_security_group" "sg" {
  vpc_id      = var.vpc_id
  name        = var.sg_name
  description = var.description
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  dynamic "ingress" {
    for_each = var.custom_rules
    content {
      description = ""
      from_port   = ingress.key
      to_port     = ingress.key
      protocol    = ingress.value
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  tags = {
    Name = var.sg_name
    Env  = var.env
  }
}
