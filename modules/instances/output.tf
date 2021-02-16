/* Outputs */
output "architecture" {
  value = local.architecture
}

output "ami_id" {
  value = data.aws_ami.amzn_linux2.id
}

output "public_instance_ids" {
  value = concat(
    aws_spot_instance_request.public.*.id,
    aws_instance.public.*.id
  )
}

output "public_instance_public_ips" {
  value = concat(
    aws_spot_instance_request.public.*.public_ip,
    aws_instance.public.*.public_ip
  )
}

output "public_instance_private_ips" {
  value = concat(
    aws_spot_instance_request.public.*.private_ip,
    aws_instance.public.*.private_ip
  )
}
