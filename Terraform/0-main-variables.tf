variable "vpc_cider_block" {
  type = string
  default = "10.0.0.0/16"
  
}

variable "customer" {
    type = string
    default = "iti"
  
}

variable "env-name" {
    type = string
    default = "devops"
  
}

# subnets ###################################################################

variable "public_subnet_cidr_block" {
  type = string
  default = "10.0.1.0/24"
}

variable "frist_private_subnet_cidr_block" {
  type = string
  default = "10.0.2.0/24"

}

variable "second_private_subnet_cidr_block" {
  type = string
  default = "10.0.3.0/24"

}
