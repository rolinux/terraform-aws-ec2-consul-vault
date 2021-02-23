/* aws_key_pair resource */

# load the required RSA public key from file
resource "aws_key_pair" "deployer" {
  key_name   = var.ssh_key_pair_name
  public_key = file(pathexpand(var.public_key_path))
}
