/* Outputs */

# return the Home IP
output "my_ip" {
  value = data.external.my_ip.result.my_ip
}
