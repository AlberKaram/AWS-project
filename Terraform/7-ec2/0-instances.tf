############ public-instance

resource "aws_instance" "public-instance" {
  ami           = "ami-0bf84c42e04519c85"
  instance_type = "t2.micro"
  subnet_id = var.public_subnet_id
  vpc_security_group_ids = [var.sg_id]
  associate_public_ip_address = true

  tags = {
    Name = "${var.customer}-${var.env-name}-public-instance"
  }
}


  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = "${file("${var.customer}_${var.env-name}_Ops.pem")}"
    host        = "${self.public_ip}"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo yum update -y",
      "sudo wget https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm",
      "sudo yum install epel-release-latest-7.noarch.rpm -y",
      "sudo yum update -y",
      "sudo yum install git python3 openssl -y",
      "pip3 install pip --upgrade",
      "pip install ansible-base",
      "pip3 install ansible",
      "sudo curl --silent --location -o /usr/local/bin/kubectl https://amazon-eks.s3.us-west-2.amazonaws.com/1.19.6/2021-01-05/bin/linux/amd64/kubectl",
      "sudo chmod +x /usr/local/bin/kubectl",
      "sudo amazon-linux-extras install ansible2 -y",
      "aws eks --region us-east-2 update-kubeconfig --name gergesEKScluster",
      "echo '[localhost]\n'${var.endpoint}' | sudo tee -a /etc/ansible/hosts'"
    ]
  }

  provisioner "file" {
    source      = "./iti_devops_Ops.pem"
    destination = "/home/ec2-user/iti_devops_Ops.pem"
  }
}