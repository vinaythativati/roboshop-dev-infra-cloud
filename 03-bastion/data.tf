data "aws_ssm_parameter" "bastion_sg_id" {
  name = "${var.project_name}-${var.env_name}-bastion_sg_id"
}

data "aws_ssm_parameter" "public_subnet" {
  name = "${var.project_name}-${var.env_name}-public-subnet-id"
}

data "aws_ami" "ami_data" {
  most_recent      = true
  owners           = ["973714476881"]

  filter {
    name   = "name"
    values = ["Redhat-9-DevOps-Practice"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

output "data" {
value = data.aws_ami.ami_data.id
}