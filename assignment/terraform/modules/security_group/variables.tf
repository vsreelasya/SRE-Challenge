variable "vpc_id" {}

variable "env" {}

variable "sg_name" {}

variable "custom_rules" {
  type = map(string)
}

variable "description" {
  default = "security group for afi"
}
