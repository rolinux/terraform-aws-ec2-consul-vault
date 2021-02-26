locals {
  # map between count from 0 and maximum number of AZs and letters
  count_to_az = {
    0 = "a"
    1 = "b"
    2 = "c"
    3 = "d"
    4 = "e"
    5 = "f"
  }
  # generate a map of hostnames and their IPs
  ew1_hostname_map = { for k, value in sort(module.eu-west-1.public_instance_public_ips) : "hashi${k + 1}-ew1${local.count_to_az[k]}" => value }

  # sorted list of private IPs as returned by the module
  ew1_private_ips = [for ip in sort(module.eu-west-1.public_instance_private_ips) : ip]

  # mapping between AWS architecture and the one used by HashiCorp
  hashi_architecture = (module.eu-west-1.architecture == "arm64") ? "arm64" : "amd64"

  # consul download url
  consul_download_url = "${var.hashicorp_releases_url}consul/${var.consul_version}/consul_${var.consul_version}_linux_${local.hashi_architecture}.zip"

  # consul download filename
  consul_download_filename = "consul_${var.consul_version}_linux_${local.hashi_architecture}.zip"

  # vault download url
  vault_download_url = "${var.hashicorp_releases_url}vault/${var.vault_version}/vault_${var.vault_version}_linux_${local.hashi_architecture}.zip"

  # vault download filename
  vault_download_filename = "vault_${var.vault_version}_linux_${local.hashi_architecture}.zip"

  depends_on = [module.eu-west-1]
}

# replicate what 'consul keygen' generates
resource "random_id" "consul_keygen" {
  byte_length = 32
}

# create the Ansible inventory file
resource "local_file" "inventory_file" {
  content = templatefile(
    "${path.module}/inventory.tpl",
    {
      ew1_hostname_map         = local.ew1_hostname_map,
      ew1_private_ips          = local.ew1_private_ips,
      vars                     = var.ansible_inventory_vars,
      consul_cluster_key       = random_id.consul_keygen.b64_std,
      consul_download_url      = local.consul_download_url,
      consul_download_filename = local.consul_download_filename,
      vault_download_url       = local.vault_download_url,
      vault_download_filename  = local.vault_download_filename,
    }
  )
  filename        = "${path.module}/ansible/inventory"
  file_permission = "0644"
}
