/* call to instances module */

# create the instances in "eu-west-1" with the right options
module "eu-west-1" {
  source = "./modules/instances"
  # instance_type = var.instance_type
  # instance_count                = var.instance_count
  instance_count = 3
  instance_type  = "t4g.nano"
  # instance_type                 = "t3.nano"
  my_ip                         = module.my_ip.my_ip
  use_spot_instead_of_on_demand = var.use_spot_instead_of_on_demand
  spot_price                    = "0.003"
  ssh_key_pair_name             = var.ssh_key_pair_name
  public_key_path               = var.public_key_path

  providers = {
    aws = aws
  }

  depends_on = [module.my_ip.my_ip]
}
