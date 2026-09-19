data "aws_ssm_parameter" "mongodb_sg_id" {
  name = "${var.project_name}-${var.env_name}-mongodb_sg_id"
}
data "aws_ssm_parameter" "mysql_sg_id" {
  name = "${var.project_name}-${var.env_name}-mysql_sg_id"
}
data "aws_ssm_parameter" "redis_sg_id" {
  name = "${var.project_name}-${var.env_name}-redis_sg_id"
}
data "aws_ssm_parameter" "rabbitmq_sg_id" {
  name = "${var.project_name}-${var.env_name}-rabbitmq_sg_id"
}
data "aws_ssm_parameter" "cataloague_sg_id" {
  name = "${var.project_name}-${var.env_name}-catloague_sg_id"
}
data "aws_ssm_parameter" "shipping_sg_id" {
  name = "${var.project_name}-${var.env_name}-shipping_sg_id"
}
data "aws_ssm_parameter" "cart_sg_id" {
  name = "${var.project_name}-${var.env_name}-cart_sg_id"
}
data "aws_ssm_parameter" "payments_sg_id" {
  name = "${var.project_name}-${var.env_name}-payments_sg_id"
}
data "aws_ssm_parameter" "users_sg_id" {
  name = "${var.project_name}-${var.env_name}-users_sg_id"
}
data "aws_ssm_parameter" "backend_alb_sg_id" {
  name = "${var.project_name}-${var.env_name}-backend_alb_sg_id"
}
data "aws_ssm_parameter" "frontend_sg_id" {
  name = "${var.project_name}-${var.env_name}-frontend_sg_id"
}
data "aws_ssm_parameter" "frontend_alb_sg_id" {
  name = "${var.project_name}-${var.env_name}-frontend_alb_sg_id"
}
data "aws_ssm_parameter" "bastion_sg_id" {
  name = "${var.project_name}-${var.env_name}-bastion_sg_id"
}

# Fetch the public IP of the machine running Terraform
data "http" "myip" {
  url = "https://ipv4.icanhazip.com"
}

