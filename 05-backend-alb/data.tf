data "aws_ssm_parameter" "backend_alb_sg_id" {
  name = "${var.project_name}-${var.env_name}-backend_alb_sg_id"
}

data "aws_ssm_parameter" "backend_subnet" {
  name = "${var.project_name}-${var.env_name}-backend-subnet-id"
}

