resource "aws_ssm_parameter" "vpc_id" {
  name  = "${var.project_name}-${var.env_name}-vpcid"
  type  = "String"
  value =  module.vpc.vpc_id
  overwrite = true
}

resource "aws_ssm_parameter" "backend_subnet" {
  name  = "${var.project_name}-${var.env_name}-backend-subnet-id"
  type  = "String"
  value = local.backend_subnet_id
   overwrite = true
}

resource "aws_ssm_parameter" "public_subnet" {
  name  = "${var.project_name}-${var.env_name}-public-subnet-id"
  type  = "String"
  value = local.public_subnet_id
   overwrite = true
}

resource "aws_ssm_parameter" "database_subnet" {
  name  = "${var.project_name}-${var.env_name}-database-subnet-id"
  type  = "String"
  value = local.database_subnet_id
   overwrite = true
}