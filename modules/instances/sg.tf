/* Security Group resources */
resource "aws_default_security_group" "default" {
  vpc_id = data.aws_vpc.default.id

  ingress {
    protocol  = -1
    self      = true
    from_port = 0
    to_port   = 0
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name  = "default_sg"
    Owner = "TEAM"
  }
}

resource "aws_security_group" "ingress_from_home_ip" {
  name        = "ingress_from_home_ip"
  description = "Allow all ingress traffic into my_ip"
  vpc_id      = data.aws_vpc.default.id

  ingress {
    description = "All traffic from home IP"
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["${var.my_ip}/32"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name  = "ingress_from_home_ip"
    Owner = "TEAM"
  }
}
