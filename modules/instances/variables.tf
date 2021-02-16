/* Module variables */
variable "instance_type" {
  type    = string
  default = "t3.micro"
}

variable "instance_count" {
  type    = number
  default = 3
}

variable "my_ip" {
  description = "my_ip - ISP public Ip"
  type        = string
}

variable "spot_price" {
  type = string
}

variable "use_spot_instead_of_on_demand" {
  description = "Use a spot instance instead of on demand"
  type        = bool
  default     = true
}

variable "public_key_path" {
  type    = string
  default = "~/.ssh/id_rsa.pub"
}

variable "ssh_key_pair_name" {
  type    = string
  default = "deployer-key"
}
