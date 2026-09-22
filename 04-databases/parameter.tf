resource "aws_ssm_parameter" "mysql" {
  name  = "${var.project_name}-${var.env_name}-mysql_root_password"
  type  = "String"
  value =  var.mysql_root_password 
   overwrite = true
}