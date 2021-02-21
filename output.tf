/* Outputs */
output "my_ip" {
  value = module.my_ip.my_ip
}

output "architecture" {
  value = module.eu-west-1.architecture
}

output "ami_id" {
  value = module.eu-west-1.ami_id
}

# these are spot instance request and not instance IDs
output "public_instance_ids" {
  value = concat(
    module.eu-west-1.public_instance_ids
  )
}

output "public_instance_public_ips" {
  value = concat(
    module.eu-west-1.public_instance_public_ips
  )
}

output "public_instance_private_ips" {
  value = concat(
    module.eu-west-1.public_instance_private_ips
  )
}
