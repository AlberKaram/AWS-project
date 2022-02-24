# AZ >>  "us-east-1a"

# public subnet

resource "aws_subnet" "public_subnet" {
  vpc_id     = var.vpc_id
  cidr_block = var.public_subnet_cidr_block
  availability_zone = "eu-west-1a"
  tags = {
    Name = "${var.customer}-${var.env-name}-public-subnet"
}
}



#private subnet 1

resource "aws_subnet" "private_subnet-1" {
  vpc_id     = var.vpc_id
  cidr_block = var.frist_private_subnet_cidr_block
    availability_zone = "eu-west-1a"


  tags = {
    Name = "${var.customer}-${var.env-name}-private_subnet-1"
}
}

# AZ >>  "us-east-1b"
#private subnet 2

resource "aws_subnet" "private_subnet-2" {
  vpc_id     = var.vpc_id
  cidr_block = var.second_private_subnet_cidr_block
  availability_zone = "eu-west-1b"


  tags = {
    Name = "${var.customer}-${var.env-name}-private_subnet-2"
}
}


