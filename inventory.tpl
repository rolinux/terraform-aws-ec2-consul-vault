[targets:children]
ew1

[targets:vars]
%{ for var_key, var_value in vars ~}
${var_key}=${var_value}
%{ endfor ~}
consul_cluster_key = "${consul_cluster_key}"
ew1_private_ips = ${jsonencode(ew1_private_ips)}

[ew1]
%{ for name, ip in ew1_hostname_map ~}
${name} ansible_host=${ip}
%{ endfor ~}
