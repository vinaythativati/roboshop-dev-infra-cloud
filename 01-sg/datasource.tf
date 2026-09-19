data "aws_ssm_parameter" "vpc" {
  name =  "${var.project_name}-${var.env_name}-vpcid"
}

/*-data "aws_ssm_parameter" "public_subnet" {
  name = "${var.project_name}-${var.env_name}-public-subnet-id"
}

data "aws_ssm_parameter" "backend_subnet" {
  name = "${var.project_name}-${var.env_name}-backend-subnet-id"
}

data "aws_ssm_parameter" "database_subnet" {
  name = "${var.project_name}-${var.env_name}-database-subnet-id"
}*/