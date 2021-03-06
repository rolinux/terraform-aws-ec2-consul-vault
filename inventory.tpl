# the template allows for multiple regions
[targets:children]
ew1

[targets:vars]
%{ for var_key, var_value in vars ~}
${var_key}=${var_value}
%{ endfor ~}
consul_cluster_key = "${consul_cluster_key}"
ew1_private_ips = ${jsonencode(ew1_private_ips)}
consul_download_url = "${consul_download_url}"
consul_download_filename = "${consul_download_filename}"
vault_download_url = "${vault_download_url}"
vault_download_filename = "${vault_download_filename}"
dc_name = "${dc_name}"

[ew1]
%{ for name, ip in ew1_hostname_map ~}
${name} ansible_host=${ip}
%{ endfor ~}
