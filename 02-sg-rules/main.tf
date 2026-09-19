#mongodb allowing connection form cataloague port 27017
resource "aws_security_group_rule" "mongodb_sg_id" {
  type              = "ingress"
  from_port         = 27017
  to_port           = 27017
  protocol          = "tcp"
  source_security_group_id = local.cataloague
  security_group_id = local.mongodb
}

#mongodb allowing connection form user port 27017
resource "aws_security_group_rule" "mongodb" {
  type              = "ingress"
  from_port         = 27017
  to_port           = 27017
  protocol          = "tcp"
  source_security_group_id = local.users
  security_group_id = local.mongodb
}

#mongodb allowing connection form bastion port 22
resource "aws_security_group_rule" "mongodbd" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  source_security_group_id = local.bastion
  security_group_id = local.mongodb
}

#REDIS allowing connection form user port 6379
resource "aws_security_group_rule" "redis_sg_id" {
  type              = "ingress"
  from_port         = 6379
  to_port           = 6379
  protocol          = "tcp"
  source_security_group_id = local.users
  security_group_id = local.redis
}

#REDIS allowing connection form cart port 6379
resource "aws_security_group_rule" "redis" {
  type              = "ingress"
  from_port         = 6379
  to_port           = 6379
  protocol          = "tcp"
  source_security_group_id = local.cart
  security_group_id = local.redis
}

#REDIS allowing connection form bastion port 22
resource "aws_security_group_rule" "redis_sg_ids" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  source_security_group_id = local.bastion
  security_group_id = local.redis
}

#MYSQL allowing connection form shipping port 3306
resource "aws_security_group_rule" "mysql" {
  type              = "ingress"
  from_port         = 3306
  to_port           = 3306
  protocol          = "tcp"
  source_security_group_id = local.shipping
  security_group_id = local.mysql
}

#MYSQL allowing connection form bastion port 22
resource "aws_security_group_rule" "mysql_sg_id" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  source_security_group_id = local.bastion
  security_group_id = local.mysql
}

#RABBITMQ allowing connection form payments port 5872
resource "aws_security_group_rule" "rabbitmq" {
  type              = "ingress"
  from_port         = 5672
  to_port           = 5672
  protocol          = "tcp"
  source_security_group_id = local.payments
  security_group_id = local.rabbitmq
}

#RABBITMQ allowing connection form bastion port 22
resource "aws_security_group_rule" "rabbitmq_sg_id" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  source_security_group_id = local.bastion
  security_group_id = local.rabbitmq
}

#CATALOAGUE allowing connection form backend_alb port 8080
resource "aws_security_group_rule" "cataloague" {
  type              = "ingress"
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  source_security_group_id = local.backend-alb
  security_group_id = local.cataloague
}

#CATALOAGUE allowing connection form bastion port 22
resource "aws_security_group_rule" "cataloague_sg_id" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  source_security_group_id = local.bastion
  security_group_id = local.cataloague
}

#USER allowing connection form backend_alb port 8080
resource "aws_security_group_rule" "user" {
  type              = "ingress"
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  source_security_group_id = local.backend-alb
  security_group_id = local.users
}

#USER allowing connection form bastion port 22
resource "aws_security_group_rule" "users_sg_id" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  source_security_group_id = local.bastion
  security_group_id = local.users
}

#CART allowing connection form backend_alb port 8080
resource "aws_security_group_rule" "cart" {
  type              = "ingress"
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  source_security_group_id = local.backend-alb
  security_group_id = local.cart
}

#CART allowing connection form bastion port 22
resource "aws_security_group_rule" "cart_sg_id" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  source_security_group_id = local.bastion
  security_group_id = local.cart
}

#SHIPPING allowing connection form backend_alb port 8080
resource "aws_security_group_rule" "shipping" {
  type              = "ingress"
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  source_security_group_id = local.backend-alb
  security_group_id = local.shipping
}

#SHIPPING allowing connection form bastion port 22
resource "aws_security_group_rule" "shipping_sg_id" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  source_security_group_id = local.bastion
  security_group_id = local.shipping
}

#PAYMENTS allowing connection form backend_alb port 8080
resource "aws_security_group_rule" "payments" {
  type              = "ingress"
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  source_security_group_id = local.backend-alb
  security_group_id = local.payments
}

#PAYMENTS allowing connection form bastion port 22
resource "aws_security_group_rule" "payments_sg_id" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  source_security_group_id = local.bastion
  security_group_id = local.payments
}

#BACKEND_ALB allowing connection from cataloague 80
resource "aws_security_group_rule" "backend_alb" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  source_security_group_id = local.cataloague
  security_group_id = local.backend-alb
}

#BACKEND_ALB allowing connection from user 80
resource "aws_security_group_rule" "backend_alb_sg_id" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  source_security_group_id = local.users
  security_group_id = local.backend-alb
}

#BACKEND_ALB allowing connection from cart 80
resource "aws_security_group_rule" "backend_alba" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  source_security_group_id = local.cart
  security_group_id = local.backend-alb
}

#BACKEND_ALB allowing connection from shipping 80
resource "aws_security_group_rule" "backend_alb_sg_ids" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  source_security_group_id = local.shipping
  security_group_id = local.backend-alb
}

#BACKEND_ALB allowing connection from payments 80
resource "aws_security_group_rule" "backend_alb1" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  source_security_group_id = local.payments
  security_group_id = local.backend-alb
}

#BACKEND_ALB allowing connection from bastion 80
resource "aws_security_group_rule" "backend_alb2" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  source_security_group_id = local.bastion
  security_group_id = local.backend-alb
}

#BACKEND_ALB allowing connection from frontend 80
resource "aws_security_group_rule" "backend_alb3" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  source_security_group_id = local.frontend
  security_group_id = local.backend-alb
}

#FRONTEND allowing connection from frontend_alb 80
resource "aws_security_group_rule" "frontend" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  source_security_group_id = local.frontend-alb
  security_group_id = local.frontend
}

#FRONTEND allowing connection from bastion 22
resource "aws_security_group_rule" "frontend_sg_id" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  source_security_group_id = local.bastion
  security_group_id = local.frontend
}

#FRONTEND-ALB allowing connection from https 443
resource "aws_security_group_rule" "frontend1" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = local.frontend-alb
}

#FRONTEND-ALB allowing connection from http 80
resource "aws_security_group_rule" "frontend2" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = local.frontend-alb
}

#BASTION allowing connection form my_IP
resource "aws_security_group_rule" "bastion" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks =  ["${chomp(data.http.myip.response_body)}/32"]
  security_group_id = local.bastion
}