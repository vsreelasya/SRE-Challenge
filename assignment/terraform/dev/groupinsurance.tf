module "groupinsurance_eip_graphite" {
  source        = "../modules/eip"
  eni_id        = module.groupinsurance_instance.primary_network_interface_id
  instance_info = var.groupinsurance
}

module "groupinsurance_instance" {
  source                 = "../modules/instance"
  instance_info          = var.groupinsurance
  availability_zone      = "us-west-2a"
  subnet_id              = module.vpc.subnet_id
  vpc_security_group_ids = [module.sg.sg_id]
}

