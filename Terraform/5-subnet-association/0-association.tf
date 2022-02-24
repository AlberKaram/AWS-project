######## public  route table association 

resource "aws_route_table_association" "public" {
  subnet_id      = var.public_subnet_id
  route_table_id = var.public_rt_id
}

######## private  route table association 

resource "aws_route_table_association" "private1" {
  subnet_id      = var.private_subnet_1_id
  route_table_id = var.private_rt_id
}

resource "aws_route_table_association" "private2" {
  subnet_id      = var.private_subnet_2_id
  route_table_id = var.private_rt_id
}