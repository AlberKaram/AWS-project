######## public route table

resource "aws_route_table" "public-rt" {
  vpc_id     = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.igw_id
  }

  tags = {
    Name = "${var.customer}-${var.env-name}-public-rt"
  }
}


######## ptivate route table wirh NGW

resource "aws_route_table" "ptivate-rt" {
  vpc_id     = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = var.ngw_id
  }

  tags = {
    Name = "${var.customer}-${var.env-name}-ptivate-rt"
  }
}