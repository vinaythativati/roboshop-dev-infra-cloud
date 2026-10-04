resource "aws_instance" "catalogue" {
  ami           = local.ami
  instance_type = "t3.micro"
  vpc_security_group_ids = [local.cataloague_sg_id]
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
    inline = ["chmod +x /tmp/boostrap.sh", "sudo sh /tmp/boostrap.sh cataloague ${var.env_name}" ]

  }
  
}


resource "aws_ec2_instance_state" "cataloague" {
  instance_id = aws_instance.cataloague.id
  state       = "stopped"
  depends_on = [terraform_data.cataloague]
}

