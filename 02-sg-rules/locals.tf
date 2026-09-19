locals {
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
}