# Spot instance request for instances in public subnet
resource "aws_spot_instance_request" "public" {
  count = var.use_spot_instead_of_on_demand ? var.instance_count : 0

  ami           = data.aws_ami.amzn_linux2.id
  subnet_id     = element(sort(data.aws_subnet_ids.default.ids), count.index)
  spot_price    = var.spot_price
  instance_type = var.instance_type
  key_name      = var.ssh_key_pair_name

  vpc_security_group_ids = [
    aws_default_security_group.default.id,
    aws_security_group.ingress_from_home_ip.id
  ]

  wait_for_fulfillment = true

  depends_on = [aws_key_pair.deployer]
}

# On demand instance request for instances in public subnet
resource "aws_instance" "public" {
  count = var.use_spot_instead_of_on_demand ? 0 : var.instance_count

  ami           = data.aws_ami.amzn_linux2.id
  subnet_id     = element(sort(data.aws_subnet_ids.default.ids), count.index)
  instance_type = var.instance_type
  key_name      = var.ssh_key_pair_name

  vpc_security_group_ids = [
    aws_default_security_group.default.id,
    aws_security_group.ingress_from_home_ip.id
  ]

  depends_on = [aws_key_pair.deployer]
}
