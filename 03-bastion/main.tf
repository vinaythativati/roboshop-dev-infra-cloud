resource "aws_instance" "bastion" {
  ami           = local.ami
  instance_type = "t3.micro"
  vpc_security_group_ids = [local.bastion_sg_id]
  subnet_id = local.public_subnet_sg_id 
iam_instance_profile = aws_iam_instance_profile.bastion.name
user_data = templatefile("${path.module}/bastion.sh.tftpl", {
   partion_number = 4
   size = 30
  })


root_block_device {
    volume_size           = 50
    volume_type           = "gp3"
   
  }

  tags = merge(var.ec2_tag,
  {  
    Name = "${local.common_name}-bastion"
  }
    )
    
  
}