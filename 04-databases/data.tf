data "aws_ssm_parameter" "mongodb_sg_id" {
  name = "${var.project_name}-${var.env_name}-mongodb_sg_id"
}

data "aws_ssm_parameter" "database_subnet" {
  name = "${var.project_name}-${var.env_name}-database-subnet-id"
}

data "aws_ssm_parameter" "redis_sg_id" {
  name = "${var.project_name}-${var.env_name}-redis_sg_id"
}

data "aws_ssm_parameter" "rabbitmq_sg_id" {
  name = "${var.project_name}-${var.env_name}-rabbitmq_sg_id"
}

data "aws_ssm_parameter" "mysql_sg_id" {
  name = "${var.project_name}-${var.env_name}-mysql_sg_id"
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