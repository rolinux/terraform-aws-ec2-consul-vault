/* Outputs */

# return the Home IP from module
output "my_ip" {
  value = module.my_ip.my_ip
}

# return the architecture mapped to the instance name
output "architecture" {
  value = module.eu-west-1.architecture
}

# return the AMI ID
output "ami_id" {
  value = module.eu-west-1.ami_id
}

# return the Public Instance IDs from module (either spot or on-demand)
output "public_instance_ids" {
  value = concat(
    module.eu-west-1.public_instance_ids
  )
}

# return the Public IPs from module (either spot or on-demand)
output "public_instance_public_ips" {
  value = concat(
    module.eu-west-1.public_instance_public_ips
  )
}

# return the Private IPs from module (either spot or on-demand)
output "public_instance_private_ips" {
  value = concat(
    module.eu-west-1.public_instance_private_ips
  )
}
