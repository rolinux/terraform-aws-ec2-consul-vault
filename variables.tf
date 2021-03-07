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

variable "spot_price" {
  description = "If Spot Instances are used then update to map to a real value"
  type        = string
  default     = "0.003"
}

variable "use_spot_instead_of_on_demand" {
  description = "Use a spot instance instead of on-demand"
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

variable "ansible_inventory_vars" {
  description = "Map/dictionary of variables to add in Ansible Inventory file"
  type        = map(any)
  default = {
    "ansible_user" : "ec2-user",
    "become" : "yes"
  }
}

variable "consul_version" {
  description = "Version of Consul to download and install"
  type        = string
  default     = "1.9.3"
}

variable "vault_version" {
  description = "Version of Vault to download and install"
  type        = string
  default     = "1.6.3"
}

variable "hashicorp_releases_url" {
  description = "HashiCorp releases url"
  type        = string
  default     = "https://releases.hashicorp.com/"
}
