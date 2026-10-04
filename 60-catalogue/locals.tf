locals {
     backend-alb = data.aws_ssm_parameter.backend_alb_sg_id.value
     backend_subnet = split(",", data.aws_ssm_parameter.backend_subnet.value)
     common_name = "${var.project_name}-${var.env_name}"
    mongodb_sg_id = data.aws_ssm_parameter.mongodb_sg_id.value
    redis_sg_id =  data.aws_ssm_parameter.redis_sg_id.value
    rabbitmq_sg_id = data.aws_ssm_parameter.rabbitmq_sg_id.value
    cataloague_sg_id =  data.aws_ssm_parameter.cataloague_sg_id.value
    mysql_sg_id = data.aws_ssm_parameter.mysql_sg_id.value
    _subnet_sg_id = split(",", data.aws_ssm_parameter.database_subnet.value)[0]
     ami = data.aws_ami.ami_data.id
    
     common_tag ={
        project_name = "${var.project_name}"
        env_name = "${var.env_name}"
        Terraform = true
     }






     
/*
    mongodb = data.aws_ssm_parameter.mongodb_sg_id.value
    mysql = data.aws_ssm_parameter.mysql_sg_id.value
    redis = data.aws_ssm_parameter.redis_sg_id.value
    rabbitmq =  data.aws_ssm_parameter.rabbitmq_sg_id.value
    cataloague = data.aws_ssm_parameter.cataloague_sg_id.value
    shipping = data.aws_ssm_parameter.shipping_sg_id.value
    cart = data.aws_ssm_parameter.cart_sg_id.value
    payments = data.aws_ssm_parameter.payments_sg_id.value 
    users = data.aws_ssm_parameter.users_sg_id.value
    backend-alb = data.aws_ssm_parameter.backend_alb_sg_id.value
    frontend = data.aws_ssm_parameter.frontend_sg_id.value
    frontend-alb = data.aws_ssm_parameter.frontend_alb_sg_id.value
    bastion = data.aws_ssm_parameter.bastion_sg_id.value
    */
     
}


    
