/*resource "aws_ssm_parameter" "mysql" {
  name  = "${var.project_name}-${var.env_name}-msql"
  type  = "String"
  value = local.database_subnet_id
   overwrite = true
}*/