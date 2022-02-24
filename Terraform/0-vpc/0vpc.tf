resource "aws_vpc" "main" {
  cidr_block       = var.vpc_cider_block

  tags = {
    Name = "${var.customer}-${var.env-name}-vpc"
  }
}