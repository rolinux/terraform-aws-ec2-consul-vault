locals {
  count_to_az = {
    0 = "a"
    1 = "b"
    2 = "c"
    3 = "d"
    4 = "e"
    5 = "f"
  }
  ew1_map = { for k, value in sort(module.eu-west-1.public_instance_public_ips) : "hashi${k + 1}-ew1${local.count_to_az[k]}" => value }
  ew2_map = { for k, value in sort(module.eu-west-2.public_instance_public_ips) : "hashi${k + 1}-ew2${local.count_to_az[k]}" => value }

  depends_on = [module.eu-west-1, module.eu-west-2]
}

resource "local_file" "inventory_file" {
  content = templatefile(
    "${path.module}/inventory.tpl",
    {
      ew1_map = local.ew1_map,
      ew2_map = local.ew2_map,
      vars    = var.ansible_inventory_vars,
    }
  )
  filename        = "${path.module}/ansible/inventory"
  file_permission = "0644"
}
