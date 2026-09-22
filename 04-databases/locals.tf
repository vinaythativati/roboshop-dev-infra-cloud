locals {
   mongodb_sg_id = data.aws_ssm_parameter.mongodb_sg_id.value
    redis_sg_id =  data.aws_ssm_parameter.redis_sg_id.value
    rabbitmq_sg_id = data.aws_ssm_parameter.rabbitmq_sg_id.value
    mysql_sg_id = data.aws_ssm_parameter.mysql_sg_id.value
    database_subnet_sg_id = split(",", data.aws_ssm_parameter.database_subnet.value)[0]
     ami = data.aws_ami.ami_data.id
      common_name = "${var.project_name}-${var.env_name}"
     common_tag ={
        project_name = "${var.project_name}"
        env_name = "${var.env_name}"
        Terraform = true
     }
}

