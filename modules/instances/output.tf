/* Outputs */

# return the architecture matching the instance name
output "architecture" {
  value = local.architecture
}

# return the AMI ID
output "ami_id" {
  value = data.aws_ami.amzn_linux2.id
}

# return the Public Instance IDs for the new instances (spot and on-demand)
output "public_instance_ids" {
  value = concat(
    aws_spot_instance_request.public.*.id,
    aws_instance.public.*.id
  )
}

# return the Public IPs for the new instances (spot and on-demand)
output "public_instance_public_ips" {
  value = concat(
    aws_spot_instance_request.public.*.public_ip,
    aws_instance.public.*.public_ip
  )
}

# return the Private IPs for the new instances (spot and on-demand)
output "public_instance_private_ips" {
  value = concat(
    aws_spot_instance_request.public.*.private_ip,
    aws_instance.public.*.private_ip
  )
}
