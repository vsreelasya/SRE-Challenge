#######################################################################################################
# variables for all modules
#######################################################################################################

variable "env" {
  default = "dev"
}

variable "dev" {
  default = {
    aws_region        = "us-west-2"
    availability_zone = "us-west-2a"
    vpc_name          = "AFI"
    gw_name           = "AFI-Dev-Gateway"
    cidr_block        = "10.1.0.0/32"
    subnet            = "10.1.0.0/32"
  }
}

variable "dev_security_name" {
  default = "dev_sg"
}

variable "dev_security_rules" {
  description = "custom security rules for development"
  type = map(string)
  default = {
    "80"    = "TCP"  # HTTP
    "8140"  = "TCP"  # puppetserver
    "443"   = "TCP"  # HTTPS
    "-1"    = "ICMP" # ICMP
  }
}

# ec2 instance parameters
variable "groupinsurance" {
  default = {
    env                     = "dev"
    subnet_id               = "subnet-1234"
    hostname                = "lime"
    snapshot_id             = "snap-098765"
    instance_type           = "t2.medium"
    volume_size             = 10
    ami_ena_support         = true
    ami_virtualization_type = "hvm"
    ami_root_device_name    = "/dev/xvd"
  }
}

variable "afi-elb" {
  default = {
    name            = "elb"
    internal        = "false"
    environment     = "prod"
    subnet          = "subnet-1234"
    nlb_vpc_id      = "vpc-1234"
  }
}

variable "aelb-tg" {
  default = {
    name                              = "aelb"
    target_type                       = "instance"
    health_check_protocol             = "TCP"
    health_check_healthy_threshold    = 3
    health_check_unhealthy_threshold  = 3
    health_check_interval             = 30
    tg_vpc_id                         = "vpc-1234"
    target_id                         = "i-1234" 
  }
}

