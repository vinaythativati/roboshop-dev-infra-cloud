locals {
     backend-alb = data.aws_ssm_parameter.backend_alb_sg_id.value
     backend_subnet = split(",", data.aws_ssm_parameter.backend_subnet.value)
     
      common_name = "${var.project_name}-${var.env_name}"
     common_tag ={
        project_name = "${var.project_name}"
        env_name = "${var.env_name}"
        Terraform = true
     }
    
}