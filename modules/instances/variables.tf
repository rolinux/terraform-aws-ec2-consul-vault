/* Module variables */
variable "instance_type" {
  description = "AWS Instance Type to use"
  type        = string
  default     = "t3.micro"
}

variable "instance_count" {
  description = "Number of instances to start - minumum 3 are recommended"
  type        = number
  default     = 3
}

variable "my_ip" {
  description = "my_ip - ISP public Ip"
  type        = string
}

variable "spot_price" {
  description = "If Spot Instances are used then update to map to a real value"
  type        = string
  default     = "0.003"
}

variable "use_spot_instead_of_on_demand" {
  description = "Use a spot instance instead of on demand"
  type        = bool
  default     = true
}

variable "public_key_path" {
  description = "Path to Public RSA key to load into AWS"
  type        = string
  default     = "~/.ssh/id_rsa.pub"
}

variable "ssh_key_pair_name" {
  description = "Name of Public Key inside AWS"
  type        = string
  default     = "deployer-key"
}
