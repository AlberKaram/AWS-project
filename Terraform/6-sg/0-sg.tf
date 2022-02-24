resource "aws_security_group" "ec2" {
  name        = "${var.customer}-${var.env-name}-sg-ec2"
  description = "Allow ec2 inbound traffic"
  vpc_id      = var.vpc_id

  ingress {
    description      = "TLS from VPC"
    from_port        = 22 
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.customer}-${var.env-name}-sg-ec2"
  }
}