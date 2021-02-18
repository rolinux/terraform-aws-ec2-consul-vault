[targets:children]
ew1
ew2

[targets:vars]
%{ for var_key, var_value in vars ~}
${var_key}=${var_value}
%{ endfor ~}

[ew1]
%{ for name, ip in ew1_map ~}
${name} ansible_host=${ip}
%{ endfor ~}

[ew2]
%{ for name, ip in ew2_map ~}
${name} ansible_host=${ip}
%{ endfor ~}