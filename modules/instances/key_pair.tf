/* aws_key_pair resource */
resource "aws_key_pair" "deployer" {
  key_name   = var.ssh_key_pair_name
  public_key = file(pathexpand(var.public_key_path))
}
