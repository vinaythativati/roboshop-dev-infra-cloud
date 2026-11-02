resource "aws_instance" "catalogue" {
  ami           = local.ami
  instance_type = "t3.micro"
  vpc_security_group_ids = [local.cataloague_sg_id ]
  subnet_id = local.backend_subnet

  tags = merge(var.ec2_tag,
  {  
    Name = "${local.common_name}-cataloague"
  }
    )
}


resource "terraform_data" "cataloague" {
  triggers_replace = [
    aws_instance.cataloague.id
    ]
    connection {
    type        = "ssh"
    user        = "ec2-user"
    password =     "DevOps321"
    host = aws_instance.mongodb.private_ip
  }

 provisioner "file" {
    source      = "bootstrap.sh"
    destination = "/tmp/boostrap.sh"
  }

  provisioner "remote-exec" {
    inline = ["chmod +x /tmp/boostrap.sh", "sudo sh /tmp/boostrap.sh cataloague ${var.env_name} ${app_version }" ]

  } 
}


resource "aws_ec2_instance_state" "cataloague" {
  instance_id = aws_instance.cataloague.id
  state       = "stopped"
  depends_on = [terraform_data.cataloague]
}

resource "aws_ami_from_instance" "cataloague" {
  name               = "${local.common_name}-cataloague-${var.app_version}-${aws_instance.cataloague.id}"
  source_instance_id = aws_instance.cataloague.id
  depends_on = [aws_ec2_instance_state.cataloague]
  tags = merge({
    Name = "${local.common_name}-catalogue-${var.app_version}-${aws_instance.cataloague.id}"
  },
  local.common_tag
  )
}

#aws launch template

resource "aws_launch_template" "cataloague" {
  name = "example"
  image_id = aws_ami_from_instance.cataloague.id
  instance_type = "t3.micro"
  vpc_security_group_ids = [local.cataloague_sg_id]
  update_default_version = true
  
  tag_specifications {
    resource_type = "instance"

    tags = merge({
      Name =  "${local.common_name}-cataloague-${var.app_version}-${aws_instance.cataloague.id}"
    },
    local.common_tag)
}
tags = merge({
  Name = "${local.common_name}-cataloague-${var.app_version}-${aws_instance.cataloague.id}"
},local.common_tag)
}
 
 #aws target group Terraform

 resource "aws_lb_target_group" "cataloague" {
  name     = "${local.common_name}-cataloague"
  port     = 8080
  protocol = "HTTP"
  vpc_id   =  local.vpc_id
  deregistration_delay = 30
  
  health_check {
    healthy_threshold = 2
    interval = 10
    matcher = "200-299"
    path = "/health"
    port = 8080
    protocol = "HTTP"
    timeout = 5
    unhealthy_threshold = 2
  }
}



