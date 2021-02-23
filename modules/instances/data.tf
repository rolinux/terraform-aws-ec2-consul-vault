/* Data sources */

# reference the default VPC
data "aws_vpc" "default" {
  default = true
}

# reference all the subnets in the default VPC
data "aws_subnet_ids" "default" {
  vpc_id = data.aws_vpc.default.id
}

/*
Find the ID of the AMI matching:
* most recent
* owned by Amazon
* with the name starting with 'amzn2-ami-hvm' - Amazon Linux 2
* with architecture matching the instance name
*/
data "aws_ami" "amzn_linux2" {
  most_recent = true

  owners = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }

  filter {
    name   = "architecture"
    values = [local.architecture]
  }
}
