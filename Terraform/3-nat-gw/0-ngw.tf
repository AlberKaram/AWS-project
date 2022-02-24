### elastic ip
resource "aws_eip" "main" {
  vpc      = true
}

resource "aws_nat_gateway" "ngw" {
  allocation_id = aws_eip.main.id
  subnet_id     = var.public_subnet_id

  tags = {
    Name = "${var.customer}-${var.env-name}-ngw"
  }


}