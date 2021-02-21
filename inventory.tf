locals {
  count_to_az = {
    0 = "a"
    1 = "b"
    2 = "c"
    3 = "d"
    4 = "e"
    5 = "f"
  }
  ew1_hostname_map = { for k, value in sort(module.eu-west-1.public_instance_public_ips) : "hashi${k + 1}-ew1${local.count_to_az[k]}" => value }

  ew1_private_ips = [for ip in sort(module.eu-west-1.public_instance_private_ips) : ip]

  depends_on = [module.eu-west-1]
}

resource "random_id" "consul_keygen" {
  # replicate what consul keygen generates
  byte_length = 32
}

resource "local_file" "inventory_file" {
  content = templatefile(
    "${path.module}/inventory.tpl",
    {
      ew1_hostname_map   = local.ew1_hostname_map,
      ew1_private_ips    = local.ew1_private_ips,
      vars               = var.ansible_inventory_vars,
      consul_cluster_key = random_id.consul_keygen.b64_std,
    }
  )
  filename        = "${path.module}/ansible/inventory"
  file_permission = "0644"
}
