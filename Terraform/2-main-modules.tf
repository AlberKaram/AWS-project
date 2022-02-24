### vpc module

module "vpc_module" {
    source = "./0-vpc"
    vpc_cider_block = var.vpc_cider_block
    customer = var.customer
    env-name = var.env-name

}

### subnet module

module "subnet_module" {
    source = "./1-subnet"
    public_subnet_cidr_block = var.public_subnet_cidr_block
    frist_private_subnet_cidr_block = var.frist_private_subnet_cidr_block
    second_private_subnet_cidr_block = var.second_private_subnet_cidr_block
    customer = var.customer
    env-name = var.env-name
    vpc_id =module.vpc_module.vpc_id

}

### igw module

module "igw_module" {
    source = "./2-igw"
    customer = var.customer
    env-name = var.env-name
    vpc_id =module.vpc_module.vpc_id

}

###  ngw module

module "ngw_module" {
    source = "./3-nat-gw"
    customer = var.customer
    env-name = var.env-name
    public_subnet_id = module.subnet_module.public_subnet_id

}

###  route table module

module "route_table_module" {
    source = "./4-route-tables"
    customer = var.customer
    env-name = var.env-name
    vpc_id = module.vpc_module.vpc_id
    ngw_id = module.ngw_module.ngw_id
    igw_id = module.igw_module.igw_id

}

###  subnet association module

module "subnet_association_module" {
    source = "./5-subnet-association"
    public_subnet_id = module.subnet_module.public_subnet_id
    private_subnet_1_id = module.subnet_module.private_subnet_1_id
    private_subnet_2_id = module.subnet_module.private_subnet_2_id
    public_rt_id = module.route_table_module.public_rt_id
    private_rt_id = module.route_table_module.private_rt_id
  
}

### sg module

module "sg_module" {
    source = "./6-sg"
    customer = var.customer
    vpc_id =module.vpc_module.vpc_id
    env-name = var.env-name

}

### instance_module

module "instance_module" {
    source = "./7-ec2"
    customer = var.customer
    env-name = var.env-name
    public_subnet_id = module.subnet_module.public_subnet_id
    sg_id=module.sg_module.sg_id

}



module "key_pair_module" {
    source = "./key_pair"
    customer = var.customer
    env-name = var.env-name
}

module "eks_module" {
    source = "./8-eks"
    vpc_id =module.vpc_module.vpc_id
    public_subnet_cidr_block = var.public_subnet_cidr_block
    private_subnet_1_id = module.subnet_module.private_subnet_1_id
    private_subnet_2_id = module.subnet_module.private_subnet_2_id
    key_name = module.key_pair_module.key_name
}
















