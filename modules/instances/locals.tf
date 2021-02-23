# extract the AWS architecture based on instance name using a regex that works in Feb 2021
locals {
  architecture = (length(regexall("^(a1|[a-z][0-9]g)", var.instance_type)) > 0) ? "arm64" : "x86_64"
}
